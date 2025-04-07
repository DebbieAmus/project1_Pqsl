pipeline {
    agent {label 'node1'}

    stages {
        stage('Build') {
            steps {
                sh'''
                ls
                '''
                
            }
        }
        stage('Upload Artifact') {
            steps {
                echo 'Uploading Artifact..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}