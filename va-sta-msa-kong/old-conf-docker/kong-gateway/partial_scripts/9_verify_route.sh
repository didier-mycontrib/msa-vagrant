#verify a route to access a service
#NB: curl http://httpbin.org/ip return our ip address
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X GET \
  --url http://xyz.mycompany.fun:8000/ip \
  --header 'Host: xyz.mycompany.fun'
#NB -H or --header of curl with 'Host: xyz.mycompany.fun'
#is used to specify the virtual host 