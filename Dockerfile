FROM nginx:1.26.0-alpine3.19-slim

RUN adduser -D -H -u 1000 cpmedia

RUN apk --update add \
    openssl \
    git \
    make \
    gcc \
    g++

WORKDIR /home/cpmedia/

RUN mkdir -p /etc/certs/ \
    && mkdir -p /mnt/public \
    && mkdir -p /var/cache/nginx/ \
    && touch /var/run/nginx.pid \
    && openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:4096 \
    -keyout /etc/certs/media1.cpcontinued.com.key \
    -out /etc/certs/media1.cpcontinued.com.crt \
    -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/OU=YourDepartment/CN=media1.cpcontinued.com" \
    && chown cpmedia:cpmedia /etc/certs/* \
    && chown cpmedia:cpmedia /var/cache/nginx/ \
    && chown cpmedia:cpmedia /var/run/nginx.pid

USER cpmedia

EXPOSE 80

EXPOSE 443

VOLUME /etc/nginx

VOLUME /mnt/public

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
