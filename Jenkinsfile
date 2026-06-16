pipeline {
    agent any
    
    environment {
        AWS_REGION = "us-east-1"
        ECR_REPO = "backend"
    }
    stages {
        stage ('checkout') {
            steps {
                git branch : 'main', url : 'https://github.com/Siddu-009/ai-devops-ecommerce.git'
            }
        }
        stage ('Build Docker') {
            steps {
                sh 'docker build -t backend ./backend'
            }
        }
        stage ('Push to ECR') {
            steps {
                sh ''' aws ecr get-login-password --region $AWS_REGION | 
                docker login --username AWS \
                --password-stdin ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com 
                docker tag backend:latest \
                ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/backend:latest 
                docker push \
                ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/backend:latest 
                '''
            }
        }
        stage ('Deploy') {
            steps {
                sh ''' 
                kubectl rollout restart deployment backend \
                -n ai-devops 
                '''
            }
        }
    }
}
