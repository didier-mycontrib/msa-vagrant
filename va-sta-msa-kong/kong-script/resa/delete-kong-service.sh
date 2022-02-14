#deleting kong service and route (for re-create it or ...)

sh delete-kong-api-service-public-private.sh session-api
sh delete-kong-api-service-public-private.sh customer-api
sh delete-kong-api-service-public-private.sh reservation-api

sh delete-kong-frontend-route.sh resa-app
 
