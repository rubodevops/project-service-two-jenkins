pipeline {
    agent any

     environment {
        AWS_ACCESS_KEY_ID     = "aws_access"
        AWS_SECRET_ACCESS_KEY = "aws_secret"
        
    }
    
     tools { 
        maven
    }
    
    
    
    
    

    stages {
    
   
    
    
     stage ('Build'){
        steps {
          sh 'mvn clean package'
        }
         post {
           success {
             echo 'Process archiving jar'
             archiveArtifacts artifacts:'**/target/*.jar'
           }
         }
       }
        
        
        
     stage('packer init') {
            steps {
               
                sh 'packer init .'
            }
        }

        
        
     stage('packer build') {
            steps {
               
                sh 'packer build ec2_ami.pkr.hcl'     
            }
        }
        
        
        
     stage('terraform init') {
            steps {
               
                sh 'terraform init'
            }
        }

        
        
    stage('terraform plan') {
            steps {
               
                sh 'terraform plan'     
            }
        }
        
        
        
        
   stage('terraform apply') {
            steps {
               
                sh 'terraform apply -auto-approve'     
            }
        }
    }
}
