#!/bin/sh

cd batch_test
chmod 755 gradlew
./gradlew clean build
cd ./build/libs
java -jar batch_test-0.0.1-SNAPSHOT.jar --job.name=JOB-1