FROM node:12.2.0

LABEL maintainer="Kakada CHHEANG <kakada.chheang@gmail.com>"

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9

# add app
COPY . /app

# generate build
RUN ng build --prod

EXPOSE 80

# start app
CMD ng serve --host 0.0.0.0 --port 80 --verbose true
