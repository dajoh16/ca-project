node{
    stage("Checkout"){
        git credentialsId: 'frederikmadsen', url: 'git@github.com:dajoh16/ca-project.git'
    }
    stage("Deploy"){
    sh 'docker-compose up -d'
    }
}