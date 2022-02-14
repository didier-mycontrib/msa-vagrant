API_SERVICE_URL=http://backend-product-repo.api.host:8230/session-api
sh init-kong-api-service-public-private.sh session-api $API_SERVICE_URL
# curl http://localhost:8000/session-api/public/session
  
API_SERVICE_URL=http://backend-customer-repo.api.host:8231/customer-api
sh init-kong-api-service-public-private.sh customer-api $API_SERVICE_URL

API_SERVICE_URL=http://backend-resa.api.host:8232/reservation-api
sh init-kong-api-service-public-private.sh reservation-api $API_SERVICE_URL
  
FRONTEND_URL=http://my-frontends:8989/resa-app
sh init-kong-frontend-route.sh resa-app $FRONTEND_URL
# curl http://localhost:8000/resa-app/index.html
