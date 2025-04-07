pipeline {
    agent { label 'node1' }
    
    environment {
        ARCHIVE_NAMES = "${env.BUILD_TAG}.tar.gz"
        BUCKET_NAME = "project-ay1"
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    sh '''
                    # Create and activate the virtual environment
                    python3 -m venv venv
                    . venv/bin/activate

                    # Create an empty file or perform build steps as needed
                    touch ${ARCHIVE_NAMES}

                    # Archive the directory and exclude the archive file itself
                    tar --exclude=${ARCHIVE_NAMES} -czvf ${ARCHIVE_NAMES} .
                    '''
                }
            }
        }
        
        stage('Upload Artifact') {
            steps {
                script {
                    sh '''
                    # Upload the tarball to the S3 bucket
                    aws s3 cp ${ARCHIVE_NAMES} s3://${BUCKET_NAME}/jenkins-${ARCHIVE_NAMES}
                    echo "Uploading Artifact to S3..."
                    '''
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                # Ensure we are in the correct directory for Ansible
                Cd Workspace
                
                # Run the Ansible playbook
                ansible-playbook -i was_ec2.yml playbook.yml
                '''
            }
        }
    }
}

    }
}
