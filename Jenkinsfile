pipeline {
    agent any

    tools {
        nodejs "NodeJS"
    }

    environment {
        RECIPIENT = 'pansuang.12@gmail.com'
    }

    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    def app = docker.build("myexpressapp:latest")
                }
            }
        }

        stage('Test Docker Access') {
            steps {
                script {
                    powershell 'docker version'
                }
            }
        }

        stage('Run App') {
            steps {
                script {
                    // Run the app inside the Docker container
                    docker.image("myexpressapp:latest").inside {
                        sh 'npm install'
                        sh 'npm run dev'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests inside the Docker container
                    docker.image("myexpressapp:latest").inside {
                        sh 'npm run test'
                    }
                }
            }
        }
    }
}

