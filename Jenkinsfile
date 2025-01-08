pipeline {
    agent any

    environment {
        IMAGE_NAME = 'demonginx'
        VERSION_TAG = "${env.BUILD_ID}"
        DOCKER_REGISTRY = 'turterdev/demonginx'
        DOCKER_CREDENTIALS_ID = 'docker-credentials-id'
        dockerImage = ''
    }

    stages {
        stage('Clone Repository') {
            steps {
                
                git branch: 'main', url: 'https://github.com/zprasopchai/demonginx.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker --version'

                    def dockerImage = "${DOCKER_REGISTRY}:${VERSION_TAG}"

                    sh """
                    docker build -t ${dockerImage} .
                    """

                    echo "Docker Image built: ${dockerImage}"
                }
            }
        }
        stage('Push Docker Image to registry') {
            steps {
                // script {
                //     withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                //         sh """
                //         echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin ${DOCKER_REGISTRY}
                //         """
                //     }
                    
                //     def dockerImage = "${DOCKER_REGISTRY}/${IMAGE_NAME}:${VERSION_TAG}"
                //     sh """
                //     docker push ${dockerImage}
                //     """
                    
                //     echo "Docker Image pushed: ${dockerImage}"
                // }
                script {
                    withCredentials([string(credentialsId: 'docker-credentials-id', variable: 'docker-hub')]) {
			        sh "docker login -u username -p ${docker-credentials-id}"
    	            }
                    sh """
                    docker push ${dockerImage}
                    """
                    echo "Docker Image pushed: ${dockerImage}"
                }
            }
        }
    }

}