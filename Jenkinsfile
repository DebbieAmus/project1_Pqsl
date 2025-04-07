pipeline {
    agent {label 'node1'}
    environment{ARCHIVE_NAMES="${env.BUILD_TAG}.tar.gz"
    BUCKET_NAME="project-ay1"

    }

    stages {
        stage('Build') {
            steps {
                script{  sh'''
                python3 -m venv venv

                . venv/bin/activate

                touch ${ARCHIVE_NAMES}

                tar --exclude=${ARCHIVE_NAMES} -czvf ${ARCHIVE_NAMES} .
                '''
            }
                
                
            }
        }
        stage('Upload Artifact') {
            steps {
                sh'''
                aws s3 cp ${ARCHIVE_NAMES} ${BUCKET_NAME}
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