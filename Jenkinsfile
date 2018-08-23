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
}