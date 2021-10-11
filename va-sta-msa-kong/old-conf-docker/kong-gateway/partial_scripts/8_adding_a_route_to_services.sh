#adding a route to access a service
#NB: curl http://httpbin.org/ip return our ip address
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/mockbin-example-service/routes \
  --data 'hosts[]=xyz.mycompany.fun'

# http://xyz.mycompany.fun:8000/ip ???