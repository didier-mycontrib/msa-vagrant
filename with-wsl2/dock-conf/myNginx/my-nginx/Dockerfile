FROM nginx:1.24

#adding ping and curl command for debug via docker run -it .... /bin/bash
#RUN apt-get update && apt-get install -y iputils-ping && apt-get install -y curl

#copy static frontend app if no ssr redirection :

#COPY tp-app/ /usr/share/nginx/html/tp-app/

COPY index.html /usr/share/nginx/html

#copy docker-nginx.conf for reverse-proxy 
COPY docker-nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
