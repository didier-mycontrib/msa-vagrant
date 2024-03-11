java -version
mvn -version
docker --version
git --version
==========
cd /vagrant/git-repo
git clone https://github.com/didier-mycontrib/spring6plus
cd spring6plus/my-native-app
cd  /vagrant/git-repo/spring6plus/my-native-app
mvn spring-boot:build-image
----
free
----
docker run --rm -d -p 8181:8181 my-native-app:0.0.1-SNAPSHOT
http://localhost:8181/my-native-app sur machine hote
-----
free

différence d'utilisation mémoire : environ 40Mo (contre 120Mo sans l'option -Pnative )

