node('master_01'){
    stage("Checkout"){
        cleanWs()
        git credentialsId: 'frederikmadsen', url: 'git@github.com:dajoh16/ca-project.git'
        stash includes: 'docker-compose.yml', name: 'docker-compose'
        stash includes: 'Dockerfile', name: 'dockerfile'
        stash includes: '**', name: 'githubrepo'
    }
} 
stage('Build'){
    parallel(){
    node(){
        stage("Archive Artifacts"){
            unstash 'githubrepo'
            sh 'pwd'
            sh 'zip -r CodeChan.zip .'
            archiveArtifacts 'CodeChan.zip'
        }
    }
    node(){
        stage('Release Build'){
            unstash 'dockerfile'
            sh 'docker build -t magida/codechan:release .'
        }
    stage('Publish'){
        withDockerRegistry(credentialsId: 'DockerHubMagida', url: '') {
            sh 'docker push magida/codechan:release'
            }
        }
    }
 
    node('ubuntu-deploy'){
        stage("Deploy"){
            unstash 'docker-compose'
            sh 'docker-compose up -d'
        }
        stage("Functional tests") {
            sh 'curl localhost:5000'
        }
    }
    }
}
node(){
       stage("Production"){
        sh 'ssh root@104.248.30.163 "docker stop CodeChan || true"' 
        sh 'ssh root@104.248.30.163 "docker pull magida/codechan:release"'
        sh 'ssh root@104.248.30.163 "docker container run --name=CodeChan --rm -d -p 5000:5000 magida/codechan:release"'
    }
}
