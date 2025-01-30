pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'ajiteshviva/j2g'
        DOCKER_TAG = "${env.GIT_BRANCH.replaceAll('/', '-')}-${env.BUILD_ID}"
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
        stage('Testing') {
            steps {
                sh "echo testing the code repository"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repo
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using Jenkins credentials store
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        // Docker login is handled automatically in this step
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }
    post {
        success {
            echo "Docker image successfully pushed to Docker Hub."
        }
        failure {
            echo "Build or push failed."
        }
    }
}
