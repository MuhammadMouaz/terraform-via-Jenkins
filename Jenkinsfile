pipeline {
    agent any
    stages {
        stage('Terraform Init') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key-id', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key-id', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat '''
                    terraform plan -var "aws_access_key=%AWS_ACCESS_KEY_ID%" -var "aws_secret_key=%AWS_SECRET_ACCESS_KEY%"
                    '''
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key-id', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat '''
                    terraform apply -var "aws_access_key=%AWS_ACCESS_KEY_ID%" -var "aws_secret_key=%AWS_SECRET_ACCESS_KEY%" -auto-approve
                    '''
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key-id', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat '''
                    terraform plan -var "aws_access_key=%AWS_ACCESS_KEY_ID%" -var "aws_secret_key=%AWS_SECRET_ACCESS_KEY%"
                    '''
                }
            }
        }
    }
}
