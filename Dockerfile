FROM ubuntu:latest

EXPOSE 80

WORKDIR /bz/

RUN apt update && apt install -y wget unzip

RUN wget https://github.com/v2fly/v2ray-core/releases/download/v5.2.1/v2ray-linux-64.zip -O /bz/v2.zip

RUN wget https://github.com/caddyserver/caddy/releases/download/v2.6.2/caddy_2.6.2_linux_amd64.tar.gz -O /bz/caddy.tar.gz

RUN unzip -d /bz/ /bz/v2.zip

RUN tar -zxvf /bz/caddy.tar.gz -C /bz/

COPY Caddyfile /bz/Caddyfile

COPY config.json /bz/config.json

COPY start.sh /bz/start.sh

RUN chmod -R 777 /bz/

ENTRYPOINT /bz/start.sh