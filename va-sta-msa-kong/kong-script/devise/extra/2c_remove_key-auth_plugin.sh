#remove key-auth plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i  http://${HOSTNAME}:8001/services/devise-service/plugins
#variable a mettre a jour selon le resultat de la commande prédédente
#puis relancer le script une nouvelle fois
export idOfPluginToDelete=95e1db1e-78ae-4265-8911-8a12d3676252
curl -i -X DELETE http://${HOSTNAME}:8001/services/devise-service/plugins/${idOfPluginToDelete}
