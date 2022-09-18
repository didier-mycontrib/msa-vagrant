java -version
mvn -version
docker --version
git --version
==========
cd /vagrant/git-repo
git clone https://github.com/didier-mycontrib/jee-spring-app-demo
cd jee-spring-app-demo/my-native-app
mvn spring-boot:build-image
----
free
----
docker run --rm -d -p 8181:8181 my-native-app:0.0.1-SNAPSHOT
curl http://localhost:8181/my-native-app
-----
free

