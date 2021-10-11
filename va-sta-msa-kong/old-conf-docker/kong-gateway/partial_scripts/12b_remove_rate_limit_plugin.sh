#remove rate-limit plugin
#HOTNAME = xyz.mycompany.fun or ...
curl -i  http://xyz.mycompany.fun:8001/services/devise-service/plugins
curl -i -X DELETE http://xyz.mycompany.fun:8001/services/devise-service/plugins/64ef77ca-61fc-4005-952b-fa60a620bbc7
