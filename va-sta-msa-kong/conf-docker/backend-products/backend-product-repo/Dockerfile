FROM node:16
# this new image will be create from parent image = node:16 (stable)

# Create app directory inside docker image
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY  package*.json  ./

RUN npm install


# Bundle app source (src, dist, ...)
COPY .   .

#setting ENV-VARIABLE
ENV PORT=8230
ENV MONGODB_URL=mongodb://root:root@mongoDB.host:27017

EXPOSE 8230
CMD [ "npm", "start" ]
