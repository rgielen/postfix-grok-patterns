#!groovy
node {

    def dockerImage = null

    stage('Checkout') {
        checkout scm
    }

    stage('Build') {
        dockerImage = docker.build("postfix-grok-patterns")
    }

    stage('Test') {
        dockerImage.inside {
            sh 'ruby test/test.rb'
        }
    }
}
