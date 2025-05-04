pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/Kundan12218014/devopsexam', branch: 'main'
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
