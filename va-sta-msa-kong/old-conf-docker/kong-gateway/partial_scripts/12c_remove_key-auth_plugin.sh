#remove key-auth plugin
#HOTNAME = xyz.mycompany.fun or ...
curl -i  http://xyz.mycompany.fun:8001/services/devise-service/plugins
curl -i -X DELETE http://xyz.mycompany.fun:8001/services/devise-service/plugins/95e1db1e-78ae-4265-8911-8a12d3676252
