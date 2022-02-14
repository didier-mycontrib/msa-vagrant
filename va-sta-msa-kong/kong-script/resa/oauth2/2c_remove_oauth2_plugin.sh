#remove key-auth plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

export idOfPluginToDelete=`curl http://${HOSTNAME}:8001/services/private-customer-api-service/plugins | jq -r '.data[] | select(.name=="oauth2") | .id'`
echo "idOfPluginToDelete=${idOfPluginToDelete}"
curl -i -X DELETE http://${HOSTNAME}:8001/services/private-customer-api-service/plugins/${idOfPluginToDelete}

export idOfPluginToDelete2=`curl http://${HOSTNAME}:8001/services/private-reservation-api-service/plugins | jq -r '.data[] | select(.name=="oauth2") | .id'`
echo "idOfPluginToDelete2=${idOfPluginToDelete2}"
curl -i -X DELETE http://${HOSTNAME}:8001/services/private-reservation-api-service/plugins/${idOfPluginToDelete2}
