#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

#register existing upstream service in kong
#NB: curl http://httpbin.org/ip return our ip address

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data 'name=mockbin-example-service' \
  --data 'url=http://httpbin.org/ip'
  
#adding a route to access a service  
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/mockbin-example-service/routes \
  --data 'name=mockbin-route' \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data 'paths[]=/ip' 
# curl http://xyz.mycompany.fun:8000/ip ???
# curl http://d2f2021:8000/ip ???
# curl http://localhost:8000/ip ???
 
#verify a route to access a service
#NB: curl http://httpbin.org/ip return our ip address
curl -i -X GET \
  --url http://${HOSTNAME}:8000/ip \
  --header "Host: ${HOSTNAME}"
#NB -H or --header of curl with 'Host: xyz.mycompany.fun'
#is used to specify the virtual host 