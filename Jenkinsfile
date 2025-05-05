// pipeline {
//     agent any

//     stages {
//         stage('Build Docker Image') {
//             steps {
//                 bat 'docker build -t my-app .'
//             }
//         }
//         stage('Stop & Remove Old Container') {
//             steps {
//                 bat 'docker stop my-app || exit 0'
//                 bat 'docker rm my-app || exit 0'
//             }
//         }
//         stage('Run New Container') {
//             steps {
//                 bat 'docker run -d -p 80:80 --name my-app my-app'
//             }
//         }
//     }

//     post {
//         failure {
//             echo "❌ Deployment failed."
//         }
//     }
// }

pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'kundankumarbhagat/mywebapp'
        DOCKER_CREDENTIALS = 'dockerhub-credentials'  // Credentials ID in Jenkins
        REGISTRY = 'docker.io'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Kundan12218014/devopsexam.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry("https://${REGISTRY}", DOCKER_CREDENTIALS) {
                        echo 'Logged in to Docker Hub'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://${REGISTRY}", DOCKER_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.run(DOCKER_IMAGE)
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
