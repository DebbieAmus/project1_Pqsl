pipeline {
    agent {label 'node1'}
    environment{ARCHIVE_NAMES="${env.BUILD_TAG}.tar.gz"
    }

    stages {
        stage('Build') {
            steps {
                script{  sh'''
                python3 -m venv venv

                . venv/bin/activate

                touch ${ARCHIVE_NAMES}
                tar --exclude=${ARCHIVE_NAMES} -czvf ${ARCHIVE_NAMES} .
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