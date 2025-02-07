@Library('my-shared-library@main') _

pipeline {
    agent { label 'java-slave' }
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
                script {
                    echo "Building Docker image"
                    buildDocker(DOCKER_IMAGE, DOCKER_TAG)
                }
            }
        }
        stage('Security Scanning') {
            steps {
                script {
                    echo "Running security scan..."
                    // This is where the shared library function is invoked.
                    securityScan(DOCKER_IMAGE, DOCKER_TAG)
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    echo "Pushing Docker image to repository"
                    pushDocker(DOCKER_IMAGE, DOCKER_TAG)
                }
            }
        }
    }
}
