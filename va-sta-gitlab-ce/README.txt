vagrant up
vagrant ssh
-------------
cd /vagrant
cd conf-docker/gitlab-ce
sh ./docker-compose-down.sh
--------
si nécessaire, fixer le mot de passe de root:
---------
sudo docker exec -it mygitlab bash
gitlab-rake "gitlab:password:reset[root]"
password: &a!z4xZz!
-----------
http://localhost:80
default user: admin
default password:adminadmin
-----------
vagrant halt