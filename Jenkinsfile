pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1'
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
                    eval $(minikube docker-env)
                    docker build -t $IMAGE_NAME:$IMAGE_TAG .
                '''
            }
        }

        stage('Deploy to Minikube') {
            steps {
                sh '''
                    # Deploy using minikube's internal kubectl
                    minikube kubectl -- apply -f k8s/deployment.yaml
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
