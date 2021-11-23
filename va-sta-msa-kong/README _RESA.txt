Test interne :
==============
my-frontend-resa:

curl http://localhost:8989/resa-app/
curl http://localhost:8989/resa-app/index.html
--> angular app (ok sauf parties WS)

curl http://localhost:8230/session-api/public/session
--> json session list from backend-products (flute enchantee , traviata, ...)

curl http://localhost:8231/customer-api/private/customer
--> json customer list from backend-customers (alexTherieur , jeanBon, ...)

curl http://localhost:8232/reservation-api/private/reservation
--> json reservation list from backend-resa

curl http://localhost:1337
--> konga (open source kong gui)



kong-api:

curl http://localhost:8000/session-api/public/session
curl http://xyz.mycompany.fun:8000/session-api/public/session
--> json session list via kong api gateway (flute enchantee , traviata, ...)

curl http://localhost:8000/resa-app/index.html
curl http://xyz.mycompany.fun:8000/resa-app/index.html
--> angular app via kong (ok with WS call)

============
avec 127.0.0.1   localhost   xyz.mycompany.fun dans C:\Windows\System32\drivers\etc\hosts

http://xyz.mycompany.fun:8000/resa-app/index.html
http://xyz.mycompany.fun:1337
http://xyz.mycompany.fun:8000/session-api/public/session


possible en plus de 

http://localhost:8000/resa-app/index.html
http://localhost:1337 (konga gui/dashbord) with username=admin , pwd=adminpwd for example
dans (konga gui/dashbord) , default/direct connection (from konga docker container to kong-gateway container)
has this URL : http://kong-gateway:8001 -no need of expose :8001 in Vagrantfile)