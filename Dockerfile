FROM mhart/alpine-node:4.8.1

ENV HOME="/home/www-data"
RUN addgroup -g 82 -S www-data \
  && adduser -u 82 -D -S -G www-data www-data \
  && npm install --global npm@2.15.11 \
  && apk add --no-cache make gcc g++ python git

COPY package.json  bower.json gulpfile.js $HOME/
RUN chown -R www-data:www-data $HOME/*

USER www-data
WORKDIR $HOME
#RUN npm install && ./node_modules/.bin/bower/install npm-shrinkwrap.json

CMD /bin/true