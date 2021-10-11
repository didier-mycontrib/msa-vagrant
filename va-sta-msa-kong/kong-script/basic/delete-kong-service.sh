#deleting a kong service (for re-create it or ...)
#HOTNAME = xyz.mycompany.fun or ...
export HOSTNAME=`hostname`

#1. display list of service routes to find id of routes
#2. delete each routes by id or by name
#3. delete service by id or name

#curl http://${HOSTNAME}:8001/services/mockbin-example-service/routes
curl -X DELETE  http://${HOSTNAME}:8001/services/mockbin-example-service/routes/mockbin-route
curl -X DELETE  http://${HOSTNAME}:8001/services/mockbin-example-service
 
