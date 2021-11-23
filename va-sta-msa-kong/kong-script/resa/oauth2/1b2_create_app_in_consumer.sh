

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

# CREATE OAuth2 client Application :

curl -i -X POST \
  --url http://${HOSTNAME}:8001/consumers/consumerCUSTOMER/oauth2 \
  --data 'name=APP_RESA'  \
  --data 'client_secret=CLIENT_SECRET_RESA'  \
  --data 'client_id=CLIENT_ID_RESA'  \
  --data "redirect_uris[]=http://konghq.com/"
  
  
# NB: The application name must be set.
# NB: If we dont specify our own client_id and client_secret kong will generate these for us. 
# (ex: client_secret="HsfKNkK86Un1VdwkyH7TveSh0kqhwgN7" , client_id="uUKxsyJ28u2hlt8eAOMyRrCuw2NYKO04" )