#adding a route to access a service
#NB: curl http://httpbin.org/ip return our ip address
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/devise-service/routes \
  --data 'name=devise-api-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/devise-api' 

# curl http://xyz.mycompany.fun:8000/devise-api/public/devise
# curl http://localhost:8000/devise-api/public/devise