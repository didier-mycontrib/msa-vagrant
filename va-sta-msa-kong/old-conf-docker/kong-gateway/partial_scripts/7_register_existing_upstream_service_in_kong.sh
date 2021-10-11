#register existing upstream service in kong
#NB: curl http://httpbin.org/ip return our ip address
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X POST \
  --url http://xyz.mycompany.fun:8001/services/ \
  --data 'name=mockbin-example-service' \
  --data 'url=http://mockbin.org'