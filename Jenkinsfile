pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    try {
                        bat 'terraform init'
                    } catch (err) {
                        error "Terraform Init failed: ${err}"
                    }
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    try {
                        bat '''
                            terraform plan \
                            -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
                            -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY"
                        '''
                    } catch (err) {
                        error "Terraform Plan failed: ${err}"
                    }
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    try {
                        bat '''
                            terraform apply \
                            -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
                            -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY" \
                            -auto-approve
                        '''
                    } catch (err) {
                        error "Terraform Apply failed: ${err}"
                    }
                }
            }
        }
        stage('Terraform Destroy') {
            steps {
                script {
                    try {
                        bat '''
                            terraform destroy \
                            -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
                            -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY" \
                            -auto-approve
                        '''
                    } catch (err) {
                        error "Terraform Destroy failed: ${err}"
                    }
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution completed'
        }
        failure {
            echo 'One or more stages failed. Please review the logs.'
        }
    }
}
