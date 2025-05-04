pipeline {
  agent any

  environment {
    IMAGE_NAME = "simple-html-app"
    CONTAINER_NAME = "html-container"
    PORT = "8080"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/Kundan12218014/devopsexam'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t ${IMAGE_NAME} ."
        }
      }
    }

    stage('Stop & Remove Old Container') {
      steps {
        script {
          sh "docker rm -f ${CONTAINER_NAME} || true"
        }
      }
    }

    stage('Run New Container') {
      steps {
        script {
          sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:80 ${IMAGE_NAME}"
        }
      }
    }
  }

  post {
    success {
      echo "✅ Deployment completed successfully!"
    }
    failure {
      echo "❌ Deployment failed."
    }
  }
}
