pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1' // Set this version in Jenkins Global Tools config
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

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            }
        }
    }
}
