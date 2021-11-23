#remove key-auth plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

export nameOfConsumerToDelete=consumerCUSTOMER
#curl -i http://${HOSTNAME}:8001/consumers/${nameOfConsumerToDelete}/oauth2/

export idOfAppToDelete=`curl http://${HOSTNAME}:8001/consumers/${nameOfConsumerToDelete}/oauth2/ | jq -r '.data[] | select(.name=="APP_RESA") | .id'`


echo "idOfAppToDelete=${idOfAppToDelete}"
curl -i -X DELETE http://${HOSTNAME}:8001/consumers/${nameOfConsumerToDelete}/oauth2/${idOfAppToDelete}

curl -i -X DELETE http://${HOSTNAME}:8001/consumers/${nameOfConsumerToDelete}
