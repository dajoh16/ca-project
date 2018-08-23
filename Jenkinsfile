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
    stage("Production"){
        sh 'echo whoami'
        sh 'ssh root@104.248.30.163 "echo hello-world > test.txt"'
    }
}