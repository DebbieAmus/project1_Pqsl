pipeline {
    agent {label 'node1'}
    environment{ARCHIVE_NAME="${env.BUILD_TAG}.tar.gz"
    }

    stages {
        stage('Build') {
            steps {
                script{  sh'''
                python3 -m venv venv

                . venv/bin/activate

                touch ${ARCHIVE_NAME}
                tar --exclude=${ARCHIVE_NAME} -czvf ${ARCHIVE_NAME} .
                tar -czvf ${BUILD_TAG}.tar.gz.
                '''
                }
                
                
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