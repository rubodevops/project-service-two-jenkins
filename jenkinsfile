pipeline {
    agent any

     environment {
        AWS_ACCESS_KEY_ID     = credentials('Access_Key_ID')
        AWS_SECRET_ACCESS_KEY = credentials('Secret_Access_Key')
        
    }

    stages {
    
    
    
     stage ('Build'){
        steps {
          sh 'sudo mvn clean package'
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
