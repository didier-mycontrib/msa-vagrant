pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World from product_repo'
            }
		}
		stage('Checkout code') {
			steps {
			   ws("/conf-docker/backend-products/backend-product-repo") {
				  checkout scm
			   }
			}
		}
		stage('recompose docker container') {
			steps {
			    ws("/conf-docker/backend-products") {
				     sh('date > lastUpdate.txt')
				}
			}
		}
    }
}
