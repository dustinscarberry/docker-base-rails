ARG RUBY_VERSION

FROM $RUBY_VERSION

# add s6 services
COPY services.d /etc/services.d

# add s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /

# install packages
RUN apk add --no-cache nginx build-base mariadb-dev nodejs tzdata

# copy app nginx config
COPY nginx/app.conf /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/inc /etc/nginx/inc

# fix nginx permissions
RUN chown -R nginx:nginx /var/lib/nginx

# copy db migration script
COPY migrations.sh /etc/cont-init.d/migrations.sh

EXPOSE 80

ENTRYPOINT ["/init"]
