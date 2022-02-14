#remove rate-limit plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`


curl http://${HOSTNAME}:8001/services/private-customer-api-service/plugins | jq -r '.'

curl http://${HOSTNAME}:8001/consumers | jq -r '.'

export nameOfConsumer=consumerCUSTOMER
curl -i http://${HOSTNAME}:8001/consumers/${nameOfConsumer}/oauth2  
