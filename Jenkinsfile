pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key-id')
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    echo "Initializing Terraform..."
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    echo "Planning Terraform changes..."
                    sh """
                        terraform plan \
                        -var "aws_access_key=${AWS_ACCESS_KEY_ID}" \
                        -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                    """
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    echo "Applying Terraform changes..."
                    sh """
                        terraform apply \
                        -var "aws_access_key=${AWS_ACCESS_KEY_ID}" \
                        -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}" \
                        -auto-approve
                    """
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                script {
                    echo "Destroying Terraform resources..."
                    sh """
                        terraform destroy \
                        -var "aws_access_key=${AWS_ACCESS_KEY_ID}" \
                        -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}" \
                        -auto-approve
                    """
                }
            }
        }
    }
}
