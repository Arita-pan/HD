pipeline {
    agent any

    tools {
        nodejs "NodeJS"
    }

    environment {
        RECIPIENT = 'pansuang.12@gmail.com'
    }

    stages {
        stage('Test Docker Access') {
            steps {
                script {
                    // Test Docker access before proceeding
                    powershell 'docker version'
                }
            }
        }

        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    app = docker.build("myexpressapp:latest")
                }
            }
        }

        stage('Run App') {
            steps {
                script {
                    // Run the app inside the Docker container
                    app.inside {
                        // Using powershell for Windows, use sh for Linux containers
                        powershell 'npm install'
                        powershell 'npm run dev'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests inside the Docker container
                    app.inside {
                        // If running on Windows, use powershell; use sh if Linux
                        powershell 'npm run test'
                    }
                }
            }
        }
    }
}

