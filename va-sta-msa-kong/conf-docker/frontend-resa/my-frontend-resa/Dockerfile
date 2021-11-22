FROM node:16
# this new image will be create from parent image = node:8 (stable)

# Create app directory inside docker image
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY  package*.json  ./

RUN npm install


# Bundle app source (src, dist, frontend-content)
COPY .   .

#setting ENV-VARIABLE
ENV PORT=8989

EXPOSE 8989
CMD [ "npm", "start" ]

