#remove rate-limit plugin

#export HOSTNAME=localhost
#export HOSTNAME=xyz.mycompany.fun
#export HOSTNAME=d2f2021
export HOSTNAME=`hostname`

curl -i  http://${HOSTNAME}:8001/services/devise-service/plugins
#variable a mettre a jour selon le resultat de la commande prédédente
#puis relancer le script une nouvelle fois
export idOfPluginToDelete=64ef77ca-61fc-4005-952b-fa60a620bbc7
curl -i -X DELETE http://${HOSTNAME}:8001/services/devise-service/plugins/${idOfPluginToDelete}
