pipeline {
    agent any
    
    stages {
        
        // stage('Checkout') {
        //     steps {
        //         checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bhagavan007/111.git']])
        //         echo "Retrieved code from Github .."
        //     }
        // }
        
         stage('Build'){
             steps{
                 sh "mvn clean compile"
                 echo "Build Successfull..."
             }
         }
        
        stage('Deploy') {
            steps {
                sh "mvn clean install -DskipTests"
                echo "Deployment Successfull..."
            }
        }

        stage('Build Docker image') {
            steps {
                sh "whoami"
                sh "pwd"
                sh "ls"
                sh "docker build -t bhagavan147/mule-docker-hello:v1 ."
                echo "Docker Image created..."
            }
        }

        stage('Docker login') {
            steps {
                withCredentials([string(credentialsId: 'DockerId', variable: 'dockerpwd')]) {
                    sh "docker login -u bhagavan147 -p ${dockerpwd}"
                }
            }
        }

        stage('Docker push') {
            steps {
                sh "docker push bhagavan147/mule-docker-hello:v1"
                echo "Docker Image pushed..."
            }
        }

        stage('Docker deployment in container') {
            steps {
                sh "docker run -d -i -t --name hello_111 -p 8081:8081 bhagavan147/mule-docker-hello:v1"
                echo "Docker Container created..."
            }
        }

        stage('Archiving'){
            steps{
                archiveArtifacts "**/target/*.jar"
                echo "Archieved jar file"
            }
        }
        
    }
}
