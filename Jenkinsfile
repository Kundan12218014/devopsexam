pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'Assuming repo is already cloned by Jenkins...'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("simple-html-app")
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    sh 'docker stop html-container || true'
                    sh 'docker rm html-container || true'
                    sh 'docker run -d -p 8080:80 --name html-container simple-html-app'
                }
            }
        }
    }
}
