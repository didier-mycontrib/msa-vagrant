#deleting a kong service (for re-create it or ...)
#HOTNAME = xyz.mycompany.fun or ...
export HOSTNAME=`hostname`

#1. delete each routes by name
#2. delete service by id or name


curl -X DELETE  http://${HOSTNAME}:8001/services/session-service/routes/session-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/session-service

curl -X DELETE  http://${HOSTNAME}:8001/services/public-customer-service/routes/public-customer-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/public-customer-service

curl -X DELETE  http://${HOSTNAME}:8001/services/private-customer-service/routes/private-customer-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/private-customer-service

curl -X DELETE  http://${HOSTNAME}:8001/services/reservation-service/routes/reservation-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/reservation-service

curl -X DELETE  http://${HOSTNAME}:8001/services/angular-resa-frontend/routes/resa-app-route
curl -X DELETE  http://${HOSTNAME}:8001/services/angular-resa-frontend  
