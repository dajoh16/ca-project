node('ubuntu-deploy'){
    stage("Checkout"){
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
        sh 'zip CodeChan.zip .'
        archiveArtifacts 'CodeChan.zip'
    }
    stage("Production"){
        sh 'ssh root@104.248.30.163 "docker container run -d -p 5000:5000 magida/codechan"'
    }
}