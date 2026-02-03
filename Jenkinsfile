pipeline {
    agent any

    environment {
        IMAGE_NAME = "jeevithabj/my_maven_app"
        DOCKERHUB = credentials('dockerhub')
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:1ms24mc038-Jeevitha/my_maven_app.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                sh 'docker login -u $DOCKERHUB_USR -p $DOCKERHUB_PSW'
                sh 'docker push $IMAGE_NAME:latest'
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully"
        }
        failure {
            echo "Pipeline execution failed"
        }
        always {
            cleanWs()
        }
    }
}
