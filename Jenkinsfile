node('ubuntu-deploy'){
    stage("Checkout"){
        cleanWs()
        git credentialsId: 'frederikmadsen', url: 'git@github.com:dajoh16/ca-project.git'
    }
    stage("Deploy"){
        sh 'docker-compose up -d'
    }
    stage("Functional tests") {
        sh 'curl localhost:5000'
    }
    stage("Archive Artifacts"){
        sh 'pwd'
        sh 'zip -r CodeChan.zip .'
        archiveArtifacts 'CodeChan.zip'
    }
    stage('Release Build'){
        sh 'docker build -t magida/codechan:release .'
    }
    stage('Publish'){
        withDockerRegistry(credentialsId: 'DockerHubMagida', url: '') {
            sh 'docker push magida/codechan:release'
        }
    }
    stage("Production"){
        sh 'ssh root@104.248.30.163 "docker stop CodeChan || true"' 
        sh 'ssh root@104.248.30.163 "docker pull magida/codechan:release"'
        sh 'ssh root@104.248.30.163 "docker container run --name=CodeChan --rm -d -p 5000:5000 magida/codechan:release"'
    }
}