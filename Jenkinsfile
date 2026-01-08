pipeline {
  agent any

  environment {
    REGISTRY = "docker.io/bus57790"   // change if Artifactory or Docker Hub
    IMAGE    = "docker-cicd-demo"
    TAG      = "${BUILD_NUMBER}"
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh '''
          docker build -t $REGISTRY/$IMAGE:$TAG .
        '''
      }
    }

    stage('Security Scan (Trivy)') {
      steps {
        sh '''
          trivy image --exit-code 0 --severity HIGH,CRITICAL \
          $REGISTRY/$IMAGE:$TAG
        '''
      }
    }

    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'docker-registry-creds',
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS'
        )]) {
          sh '''
            echo "$DOCKER_PASS" | docker login $REGISTRY \
              -u "$DOCKER_USER" --password-stdin

            docker push $REGISTRY/$IMAGE:$TAG
          '''
        }
      }
    }
  }

  post {
    success {
      echo "Docker Image Published: $REGISTRY/$IMAGE:$TAG"
    }
    failure {
      echo "Pipeline Failed"
    }
  }
}

