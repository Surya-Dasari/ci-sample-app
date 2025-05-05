pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1' // Set this version in Jenkins Global Tools config
    }

    environment {
        IMAGE_NAME = 'ci-sample-app'
        IMAGE_TAG = 'v1'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Surya-Dasari/ci-sample-app.git', branch: 'main', credentialsId: 'github-pat'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    # Point Docker to Minikube's Docker daemon
                    sudo eval $(minikube docker-env)

                    # Build the Docker image inside Minikube context
                    sudo docker build -t $IMAGE_NAME:$IMAGE_TAG .
                '''
            }
        }

        stage('Deploy to Minikube') {
            steps {
                sh '''
                    # Apply the Kubernetes manifest
                    sudo kubectl apply -f k8s/deployment.yaml
                '''
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            }
        }
    }
}

