#!/usr/bin/env bash

/opt/parse_osc.pl -h ${DB_HOST} -o ${DB_PORT} -d ${DB_NAME} -u ${DB_USER} -p ${DB_PASSWORD} -l ${REPLICATION_URL}
