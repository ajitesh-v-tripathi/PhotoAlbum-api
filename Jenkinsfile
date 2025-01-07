@Library('my-shared-library') _

pipeline {
    agent {label 'java-slave'}
    environment {
        DOCKER_IMAGE = 'ajiteshviva/j2g'
        DOCKER_TAG = "${env.GIT_BRANCH.replaceAll('/', '-')}-${env.BUILD_ID}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                buildDocker(DOCKER_IMAGE, DOCKER_TAG)
            }
        }
        stage('Push Docker Image') {
            steps {
                pushDocker(DOCKER_IMAGE, DOCKER_TAG)
            }
        }
    }
}
