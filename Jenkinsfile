pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-app .'
            }
        }
        stage('Stop & Remove Old Container') {
            steps {
                bat 'docker stop my-app || exit 0'
                bat 'docker rm my-app || exit 0'
            }
        }
        stage('Run New Container') {
            steps {
                bat 'docker run -d -p 80:80 --name my-app my-app'
            }
        }
    }

    post {
        failure {
            echo "❌ Deployment failed."
        }
    }
}
