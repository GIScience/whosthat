FROM perl:5.43

RUN apt update
RUN apt install -y libdbd-pg-perl
RUN apt install -y libwww-perl
RUN apt install -y cron

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

