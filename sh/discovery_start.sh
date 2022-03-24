echo ">> project Build start!"

echo ">> move discovey directory"

cd ../discovery


echo ">> give permission & gradlew clean build"

chmod 755 gradlew

./gradlew clean build


echo ">> move build/libs"

cd ./build/libs


echo ">> execute discovery"

java -jar discovery-0.0.1.jar