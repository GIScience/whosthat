FROM perl:5.43

RUN rm -f /etc/apt/apt.conf.d/docker-clean; \
    echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt update \
    && apt install -y --no-upgrade --no-install-recommends \
        libdbd-pg-perl \
        libwww-perl

COPY parse_osc.pl update.sh /opt/

ENV REPLICATION_URL="https://planet.openstreetmap.org/replication/hour/"

CMD ["/opt/update.sh"]

