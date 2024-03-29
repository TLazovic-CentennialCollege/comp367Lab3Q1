pipeline {
    agent any
    environment {
        dockerRegistry = "tlazovicCentennialCollege/lab3q1"
        dockerRegistryCredential = "TLazovic-CentennialCollege-DockerHub"
		dockerImage = ""
		dockerImageBuildNumber = "latest"
    }    

    stages {
        stage("Check out") {
            steps {
                git branch: 'main', credentialsId: 'TLazovic-CentennialCollege-GitHub', url: 'https://github.com/TLazovic-CentennialCollege/comp367Lab3Q1'
            }
        }
        stage("Build app") {
            steps {
                echo "building the application ..."
                // using the Pipeline Maven plugin we can set maven configuration settings, publish test results, and annotate the Jenkins console
                withMaven(maven: 'maven3.9.6') {
                    dir("app") {
                        bat 'mvn clean package'
                    }
                }
				//bat "copy app\\target\\lab2q3-0.0.1-SNAPSHOT.jar c:\\temp\\"
            }
        }
    //     stage("Docker build") {
    //         steps {
    //             echo "docker build ..." 
				// bat 'docker build -t lab3q1 .'
    //         }
    //     }
        stage("Docker build") {
            steps {
                echo "docker build ..." 
                script {
                    //dockerImage = docker.build("lab3q1:latest")
					dockerImage = docker.build "$dockerRegistry:$dockerImageBuildNumber"
                }
            }
        }
        stage('Docker push') {
            steps{
                script {
					docker.withRegistry("", dockerRegistryCredential ) {
						dockerImage.push()
					}
                }
            }
        }
	}
}