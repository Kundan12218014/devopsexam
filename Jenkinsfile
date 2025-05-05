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

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t kundankumarbhagat/mywebapp .'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                bat 'docker stop mywebapp || exit 0'
                bat 'docker rm mywebapp || exit 0'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                bat '''
                    docker login -u %DOCKER_USERNAME% -p %DOCKER_PASSWORD%
                    echo "Logged in to Docker Hub"
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push kundankumarbhagat/mywebapp:latest'
            }
        }

        stage('Run New Container') {
            steps {
                bat 'docker run -d -p 80:80 --name mywebapp kundankumarbhagat/mywebapp'
            }
        }
    }

    post {
        failure {
            echo "❌ Deployment failed."
        }
    }
}
