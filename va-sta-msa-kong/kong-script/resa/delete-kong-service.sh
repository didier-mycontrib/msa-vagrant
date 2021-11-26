#deleting a kong service (for re-create it or ...)
#HOTNAME = xyz.mycompany.fun or ...
export HOSTNAME=`hostname`

#1. delete each routes by name
#2. delete service by id or name


curl -X DELETE  http://${HOSTNAME}:8001/services/public-session-service/routes/public-session-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/public-session-service

curl -X DELETE  http://${HOSTNAME}:8001/services/private-session-service/routes/private-session-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/private-session-service

curl -X DELETE  http://${HOSTNAME}:8001/services/public-customer-service/routes/public-customer-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/public-customer-service

curl -X DELETE  http://${HOSTNAME}:8001/services/private-customer-service/routes/private-customer-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/private-customer-service

curl -X DELETE  http://${HOSTNAME}:8001/services/public-reservation-service/routes/public-reservation-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/public-reservation-service

curl -X DELETE  http://${HOSTNAME}:8001/services/private-reservation-service/routes/private-reservation-api-route
curl -X DELETE  http://${HOSTNAME}:8001/services/private-reservation-service

curl -X DELETE  http://${HOSTNAME}:8001/services/angular-resa-frontend/routes/resa-app-route
curl -X DELETE  http://${HOSTNAME}:8001/services/angular-resa-frontend  
