#init services and routes with /public and /private conventions
export HOSTNAME=`hostname`

# API_NAME as first argument of script (ex: xyz-api)
API_NAME=$1
# SERVICE_NAME as  ${API_NAME}-service
SERVICE_NAME=${API_NAME}-service
# SERVICE_URL as second argument of script (ex: http://backend-xyz.api.host:8230/xyz-api)
SERVICE_URL=$2

echo "*** Init Kong service=${SERVICE_NAME} for api=${API_NAME} with url=${SERVICE_URL}"


curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data "name=public-${SERVICE_NAME}" \
  --data "url=${SERVICE_URL}/public"

curl -i -X POST \
  --url http://${HOSTNAME}:8001/services \
  --data "name=private-${SERVICE_NAME}" \
  --data "url=${SERVICE_URL}/private"
  
#adding a route to access public service 
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/public-${SERVICE_NAME}/routes \
  --data "name=public-${API_NAME}-route" \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data "paths[]=/${API_NAME}/public"
# curl http://xyz.mycompany.fun:8000/${API_NAME}/public/xyz
# curl http://d2f2021:8000/${API_NAME}/public/xyz
# curl http://localhost:8000/${API_NAME}/public/xyz
  


  
#adding a route to access private service 
curl -i -X POST \
  --url http://${HOSTNAME}:8001/services/private-${SERVICE_NAME}/routes \
  --data "name=private-${API_NAME}-route" \
  --data 'hosts[]=xyz.mycompany.fun' \
  --data 'hosts[]=d2f2021' \
  --data 'hosts[]=localhost' \
  --data "paths[]=/${API_NAME}/private" 
  
