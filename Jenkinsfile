pipeline{
agent any
environment {
DOCKERHUB_CREDENTIALS = credentials ('docker_id')
}
stages {

stage ('init'){
agent any
steps {
bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
  }
}

stage('build backend'){
agent any
when{
changeset "**/gestionCatalogue5Gr1/*.*"
beforeAgent true
}
steps {
dir ('backend'){
bat 'docker build -t $DOCKERHUB_CREDENTIALS_USR/devops_prjt:$BUILD_ID .'
bat 'docker push $DOCKERHUB_CREDENTIALS_USR/devops_prjt:$BUILD_ID .'

}

}
}
stage('Testing') {
            steps {
                script {
                    // Run tests (unit or integration)
                    // Add your testing commands here
                }
            }
        }
stage('Cleanup') {
            steps {
                script {

                   bat' echo Cleanup complete'
                }
            }
        }
stage('logout'){
steps{
bat 'docker logout'
}
}
}
}

