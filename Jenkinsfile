#!groovy
node {

    stage('Checkout') {
        checkout scm
    }

    stage('Test') {
        sh "test/test-with-docker.sh"
    }

}
