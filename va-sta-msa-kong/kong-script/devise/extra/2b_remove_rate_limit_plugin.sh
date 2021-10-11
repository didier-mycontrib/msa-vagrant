#remove rate-limit plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

export idOfPluginToDelete=`curl http://${HOSTNAME}:8001/services/devise-service/plugins | jq -r '.data[] | select(.name=="rate-limiting") | .id'`
echo "idOfPluginToDelete=${idOfPluginToDelete}"
curl -i -X DELETE http://${HOSTNAME}:8001/services/devise-service/plugins/${idOfPluginToDelete}
