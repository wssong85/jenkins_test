
# jenkins-pipeline
node {
    stage ('- clone') {
        git 'https://github.com/wssong85/jenkins_test.git'
    }
    stage ('gradle wrap') {
        sh 'cd discovery'
        sh 'chmod 755 gradlew'
    }
    stage ('gradlew build') {
        sh './gradlew clear build'
    }
    stage ('application start') {
        sh 'JENKINS_NODE_COOKIE=dontKillMe nohup java -jar /var/jenkins_home/workspace/jenkins_test/discovery/build/libs/discovery-0.0.1.jar > /dev/null 2>&1 &'
    }
}