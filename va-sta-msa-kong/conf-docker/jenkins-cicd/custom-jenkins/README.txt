#source: https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code
# CASC_JENKINS_CONFIG is for plugin "jenkins configuration as code"
le chemin /var/jenkins_home/jenkins.yaml a posé problème (répertoire à priori réinitialisé ou autre)
et donc nouvel emplacement (dans Dockerfile) pour le jenkins_ou_casc.yaml 