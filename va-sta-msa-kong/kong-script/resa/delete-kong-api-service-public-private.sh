#delete services and routes with /public and /private conventions
export HOSTNAME=`hostname`

# API_NAME as first argument of script (ex: xyz-api)
API_NAME=$1
# SERVICE_NAME as  ${API_NAME}-service
SERVICE_NAME=${API_NAME}-service

#1. delete each routes by name
#2. delete service by id or name


curl -X DELETE  http://${HOSTNAME}:8001/services/public-${SERVICE_NAME}/routes/public-${API_NAME}-route
curl -X DELETE  http://${HOSTNAME}:8001/services/public-${SERVICE_NAME}

curl -X DELETE  http://${HOSTNAME}:8001/services/private-${SERVICE_NAME}/routes/private-${API_NAME}-route
curl -X DELETE  http://${HOSTNAME}:8001/services/private-${SERVICE_NAME}
