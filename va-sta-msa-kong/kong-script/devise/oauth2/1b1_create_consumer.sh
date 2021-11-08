#add consumer with username

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i -X POST \
  --url http://${HOSTNAME}:8001/consumers/ \
  --data "username=consumer1234" \
  --data "custom_id=1234"
  
#by default , new id of consumer = id = auto generated uuid
# a custom_id exists
