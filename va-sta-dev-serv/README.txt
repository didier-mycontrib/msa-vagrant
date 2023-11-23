=================================
at first start
=================================
cd /vagrant
cd conf-docker
cd kafka
sh ./docker-compose-up-bg.sh

docker image ls
	REPOSITORY          TAG       IMAGE ID       CREATED      SIZE
	bitnami/zookeeper   latest    892c866d8ff3   6 days ago   522MB
	bitnami/kafka       latest    f89ec27130ef   7 days ago   565MB
docker container ls

==============================
kafka url:
---------
inside vm:
    
outside vm:
localhost:9092
