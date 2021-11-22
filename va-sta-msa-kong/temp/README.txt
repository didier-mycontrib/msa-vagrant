git clone https://github.com/Kong/kong-oauth2-hello-world
cd kong-oauth2-hello-world
sudo apt-get update
sudo apt-get install nodejs
sudo apt-get install npm
npm install

sh launch_app.sh

http://127.0.0.1:8080/authorize?response_type=code&scope=read%20write&client_id=CLIENT_ID_1234