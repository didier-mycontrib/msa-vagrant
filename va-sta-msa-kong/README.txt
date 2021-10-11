Test interne :
==============
my-frontend1:

curl http://localhost:8989/ng-bs4-app/
curl http://localhost:8989/ng-bs4-app/index.html
--> angular app

curl http://localhost:8282/devise-api/public/devise
--> json devise list from backend1

curl http://localhost:1337
--> konga (open source kong gui)

curl http://localhost:8989/ng-bs4-app/
curl http://localhost:8989/ng-bs4-app/index.html
--> angular app

kong-api:

curl http://localhost:8000/devise-api/public/devise
curl http://xyz.mycompany.fun:8000/devise-api/public/devise
--> json devise list via kong api gateway

curl http://localhost:8989/ng-bs4-app/index.html
curl http://xyz.mycompany.fun:8989/ng-bs4-app/index.html
--> angular app via kong

============
avec 127.0.0.1   localhost   xyz.mycompany.fun dans C:\Windows\System32\drivers\etc\hosts

http://xyz.mycompany.fun:8000/ng-bs4-app/index.html
http://xyz.mycompany.fun:1337
http://xyz.mycompany.fun:8000/devise-api/public/devise


possible en plus de 

http://localhost:80/ng-bs4-app/index.html
http://localhost:1337 (konga gui/dashbord) with username=admin , pwd=adminpwd for example
dans (konga gui/dashbord) , default/direct connection (from konga docker container to kong-gateway container)
has this URL : http://kong-gateway:8001 -no need of expose :8001 in Vagrantfile)