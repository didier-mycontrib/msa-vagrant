#delete services and routes for frontend app
export HOSTNAME=`hostname`

# APP_NAME as first argument of script (ex: xyz-app)
APP_NAME=$1
# SERVICE_NAME as  ${APP_NAME}-frontend-service
SERVICE_NAME=${APP_NAME}-frontend-service

#1. delete each routes by name
#2. delete service by id or name

curl -X DELETE  http://${HOSTNAME}:8001/services/${SERVICE_NAME}/routes/${APP_NAME}-route
curl -X DELETE  http://${HOSTNAME}:8001/services/${SERVICE_NAME}

