#add key-auth plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i -X POST \
  --url ${HOSTNAME}:8001/services/devise-service/plugins/ \
  --data "name=oauth2" \
  --data "config.provision_key=my_not_generated_provision_key" \
  --data "config.scopes=read" \
  --data "config.scopes=write" \
  --data "config.mandatory_scope=true" \
  --data "config.enable_client_credentials=true" \
  --data "config.accept_http_if_already_terminated=true" \
  --data "config.token_expiration=7200" \
  --data "config.enable_password_grant=true" \
  --data "config.enable_authorization_code=true" \
  --data "config.global_credentials=true"

# returning response with important provision_key  (ex: 1c4QPOX0xwTT8Jyoh7njSf7VzmmVO6WZ
# or my_not_generated_provision_key)
  