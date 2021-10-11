#add consumer with username

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i -X POST \
  --url http://${HOSTNAME}:8001/consumers/ \
  --data "username=consumer1"
  
#by default , new id of consumer = id = auto generated uuid
# a custom_id exists

curl -i -X POST \
  --url http://${HOSTNAME}:8001/consumers/consumer1/key-auth/ \
  --data 'key=consumer1-key'
  
#NB: 2 customers ne peuvent pas avoir la meme valeur de la clef (test d'unicité effectué).
#...  
  
# need --header "apikey: consumer1-key" curl option
# curl http://xyz.mycompany.fun:8000/devise-api/public/devise --header "apikey: consumer1-key"

#may accept ?apiKey=consumer1-key at end of api routes if 
# --data 'config.key_names=apiKey' option of key-auth plugin config
#curl http://xyz.mycompany.fun:8000/devise-api/public/devise?apiKey=consumer1-key