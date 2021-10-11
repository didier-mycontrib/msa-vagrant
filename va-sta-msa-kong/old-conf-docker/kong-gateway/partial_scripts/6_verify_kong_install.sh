#verify kong install
#HOTNAME = xyz.mycompany.fun or ...
curl -i -X GET --url http://xyz.mycompany.fun:8001/services
# kong GUI (in browser):
echo http://xyz.mycompany.fun:8002