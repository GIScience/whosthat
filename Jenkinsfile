pipeline {
    agent { label 'worker' }
    options {
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        REPO_NAME = sh(returnStdout: true, script: 'basename `git remote get-url origin` .git').trim()
        LATEST_AUTHOR = sh(returnStdout: true, script: 'git show -s --pretty=%an').trim()
        LATEST_COMMIT_ID = sh(returnStdout: true, script: 'git describe --tags --long  --always').trim()

        DOCKER_CREDENTIALS_ID = 'docker-heigit-ci-service'
    }

    stages {
        stage('Build and publish Docker image for whosthat') {
            agent {
                kubernetes {
                    inheritFrom "BASE DOCKER"
                }
            }
            when {
                branch 'ohsome-whosthat'
            }
            steps {
                container('docker') {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh 'docker login -p $PASSWORD -u $USERNAME repo.heigit.org'
                    }
                    dir("scripts") {
                        sh "docker build --push --builder=kube --platform=linux/amd64 -t repo.heigit.org/heigit/whosthat-script:ohsome ."
                    }
                    dir("www") {
                        sh "docker build --push --builder=kube --platform=linux/amd64 -t repo.heigit.org/heigit/whosthat-www:ohsome ."
                    }
                }
            }
        }
    }
}
