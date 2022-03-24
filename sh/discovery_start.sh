#!/bin/sh

echo ">> project Build start!"
echo ">> move discovey directory"
cd ../discovery
echo ">> give permission & gradlew clean build"
chmod 755 gradlew
./gradlew clear build
echo ">> move build/libs"
cd ./build/libs


nohup java -jar discovery-0.0.1.jar > /dev/null 2>&1 &

#PNAME="discovery-0.0.1.jar"
#PID=`ps -ef | grep ${PNAME} | grep -v grep | grep -v sh | awk '{printf($2);}'`
#if [ ${PID} ]; then
#  echo "${PNAME} is already running! : ${PID}"
#  exit 0
#else
#  echo "${PNAME} is started..."
#fi
#RESULT=$(java -jar ${PNAME} )
#echo ">> setting..."
#if [ ${RESULT} -eq 0 ]; then
#  echo "done!!"
#  exit 0
#else
#  echo "error: ${RESULT}"
#  exit ${RESULT}
#fi