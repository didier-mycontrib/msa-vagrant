#add key-auth plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

# NB: --url https://${HOSTNAME}:8443/devise-api/oauth2/token OK
# NB: --url http://${HOSTNAME}:8001/devise-api/oauth2/token  not working , HTTPS REQUIRED !!!

# client-credentials oauth2 flow:
# ----------------------------------
# --data "grant_type=client_credentials" \
# with just client_id & client_secret

# password oauth2 flow:
# ----------------------------------
  # --data "authenticated_userid=consumer1234" \
  #  --data "grant_type=password" \
	
curl -i -X POST \
  --url https://localhost:8443/devise-api/oauth2/token \
  --data "client_id=CLIENT_ID_1234" \
  --data "client_secret=CLIENT_SECRET_1234" \
  --data "scope=read"  \
  --data "grant_type=client_credentials" \
  --data "provision_key=1c4QPOX0xwTT8Jyoh7njSf7VzmmVO6WZ" --insecure


#  provision_key is from plugin attached to service  (ex: 1c4QPOX0xwTT8Jyoh7njSf7VzmmVO6WZ)
  
# response {"token_type":"bearer","expires_in":7200,"access_token":"BWhku0x1zbp0mFSPaufoLbsunGSw5iwE"}