FROM nginx

#adding ping and curl command for debug via docker run -it .... /bin/bash
RUN apt-get update && apt-get install -y iputils-ping && apt-get install -y curl

#copy angular app :
# either COPY /dist/ng-bs4-app /usr/share/nginx/html with base/href="/"
# either COPY /dist /usr/share/nginx/html with base/href="."
COPY /dist /usr/share/nginx/html

#copy docker-nginx.conf for ngr-
COPY docker-nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
