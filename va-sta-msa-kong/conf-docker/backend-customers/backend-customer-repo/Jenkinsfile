pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World from customer_repo'
            }
		}
		stage('Checkout code') {
			steps {
			   ws("/conf-docker/backend-customers/backend-customer-repo") {
				  checkout scm
			   }
			}
		}
		stage('recompose docker container') {
			steps {
			    ws("/conf-docker/backend-customers") {
				     sh('date > lastUpdate.txt')
				}
			}
		}
    }
}
