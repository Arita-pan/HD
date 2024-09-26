pipeline {
    agent any

    tools {
        nodejs "NodeJS"
    }

    environment {
        //DATADOG_API_KEY = credentials('datadog-api-key')
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
                    app = docker.build("myexpressapp:latest")
                } // Closing script block here
            }
        }

        stage('Test') {
            steps {
                script {
                    app.inside {
                        //sh 'npm run test' // Use sh to run shell commands in Jenkins
                        bat 'npm run test'
                    }
                }
            }
        }
    }
}
