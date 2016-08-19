FROM mhart/alpine-node

ENV HOME=/home/node  
ENV NODE_WORKDIR=$HOME

RUN apk --update add \  
 git \
 bash \
 python \
 openssl \
 libgcc \
 make \
 libstdc++ \
 g++ \
 openssh-client

RUN rm -rf /var/cache/apk/*

RUN addgroup node \  
 && adduser -h /home/node -s /bin/false -G node -D node

ADD ./node_modules $NODE_WORKDIR/  
RUN chown -R node:node $HOME 

USER node  
WORKDIR $NODE_WORKDIR

ENTRYPOINT /bin/sh 