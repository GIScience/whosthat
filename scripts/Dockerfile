FROM perl:5.43

RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt update \
    && apt install -y --no-upgrade --no-install-recommends \
        libdbd-pg-perl \
        libwww-perl \
        cron

COPY parse_osc.pl /opt/

ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG REPLICATION_URL
RUN echo "6 * * * * /opt/parse_osc.pl -h ${DB_HOST} -o ${DB_PORT} -d ${DB_NAME} -u ${DB_USER} -p ${DB_PASSWORD} -l ${REPLICATION_URL} >> /opt/whosthat.log 2>&1" > /etc/cron.d/whosthat
RUN echo "#" >> /etc/cron.d/whosthat # empty line
RUN crontab /etc/cron.d/whosthat

CMD ["cron", "-f"]

