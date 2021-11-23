#add key-auth plugin

#export HOSTNAME=localhost
export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
#export HOSTNAME=`hostname`

# NB: --url https://${HOSTNAME}:8443/customer-api/private/oauth2/token OK
# NB: --url http://${HOSTNAME}:8001/customer-api/private/oauth2/token  not working , HTTPS REQUIRED !!!

# client-credentials oauth2 flow:
# ----------------------------------
# --data "grant_type=client_credentials" \
# with just client_id & client_secret

# password oauth2 flow:
# ----------------------------------
  # --data "authenticated_userid=consumer1234" \
  #  --data "grant_type=password" \
	
curl -i -X POST \
  --url https://${HOSTNAME}:8443/customer-api/private/oauth2/token \
  --data "client_id=CLIENT_ID_RESA" \
  --data "client_secret=CLIENT_SECRET_RESA" \
  --data "scope=read"  \
  --data "grant_type=password" \
  --data "authenticated_userid=jeanBon" \
  --data "provision_key=my_not_generated_provision_key" --insecure


#  provision_key is from plugin attached to service  (ex: 1c4QPOX0xwTT8Jyoh7njSf7VzmmVO6WZ)
  
# response {"token_type":"bearer","expires_in":7200,"access_token":"BWhku0x1zbp0mFSPaufoLbsunGSw5iwE"}
# ou {"token_type":"bearer","expires_in":14400,"access_token":"ZgaS7drmiINJBynTDp0VK3jkB7ssuQUE","refresh_token":"PpoLRI5UZSlJILpi5JSLqPn9R69nHX2a"}