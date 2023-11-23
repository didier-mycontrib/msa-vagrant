java -version
mvn -version
docker --version
git --version
==========
cd /vagrant/git-repo
git clone https://github.com/didier-mycontrib/jee-spring-app-demo
cd jee-spring-app-demo/my-native-app
cd  /vagrant/git-repo/jee-spring-app-demo/my-native-app
mvn spring-boot:build-image
----
free
----
docker run --rm -d -p 8181:8181 my-native-app:0.0.1-SNAPSHOT
http://localhost:8181/my-native-app sur machine hote
-----
free

différence d'utilisation mémoire : 150928 - 120084 = environ 30000 = environ 30Mo

