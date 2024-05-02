#!/bin/bash
set -ex

apt update
apt install -y maven

git clone --depth 1 --branch v0.0.9 https://github.com/spring-attic/propdeps-plugin.git /tmp/propdeps-plugin
cd /tmp/propdeps-plugin
./gradlew install -x test

curl https://maven.repository.redhat.com/ga/com/ibm/websphere/uow/6.0.2.17/uow-6.0.2.17.jar -o /tmp/uow-6.0.2.17.jar && \
mvn install:install-file -Dfile=/tmp/uow-6.0.2.17.jar -DgroupId=com.ibm.websphere -DartifactId=uow -Dversion=6.0.2.17 -Dpackaging=jar -Dhttps.protocols=TLSv1.2
