pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1' // Set this version in Jenkins Global Tools config
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'git@github.com:Surya-Dasari/ci-sample-app.git', branch: 'main'
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
