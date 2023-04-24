ARG RUBY_VERSION

FROM $RUBY_VERSION

# add s6 services
COPY services.d /etc/services.d
RUN chmod -R +x /etc/services.d

# override service startup timeout
ENV S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0

# add s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.4.1/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.4.1/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

# copy db migration script
COPY migrations.sh /etc/cont-init.d/migrations.sh

# install packages
RUN apk add --no-cache nginx build-base mariadb-dev nodejs tzdata

# copy app nginx config
COPY nginx/app.conf /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/inc /etc/nginx/inc

# fix nginx permissions
RUN chown -R nginx:nginx /var/lib/nginx

EXPOSE 80

ENTRYPOINT ["/init"]