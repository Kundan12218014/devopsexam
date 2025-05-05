pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app .'
            }
        }
        stage('Stop & Remove Old Container') {
            steps {
                sh 'docker stop my-app || exit 0'
                sh 'docker rm my-app || exit 0'
            }
        }
        stage('Run New Container') {
            steps {
                sh 'docker run -d -p 80:80 --name my-app my-app'
            }
        }
    }

    post {
        failure {
            echo "❌ Deployment failed."
        }
    }
}
