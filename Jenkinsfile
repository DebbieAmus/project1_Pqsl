pipeline {
    agent {label 'node1'}

    stages {
        stage('Build') {
            steps {
                sh'''
                python3 -m venv venv

                source venv/bin/activate

                pip install -r requirement.txt
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