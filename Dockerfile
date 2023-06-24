FROM ubuntu:latest

ENV GOBGP_VERSION="3.15.0"
ENV MRT_FILE="/gobgp/mrtdump"
ENV GOBGPD_CONFIG="/gobgp/gobgpd.conf"

WORKDIR /gobgp

RUN apt-get update -y && apt-get -y install wget supervisor iproute2 inetutils-ping bash-completion

RUN wget -q https://github.com/osrg/gobgp/releases/download/v${GOBGP_VERSION}/gobgp_${GOBGP_VERSION}_linux_amd64.tar.gz -O - | tar -xz

ENV PATH=/gobgp:$PATH

ADD entrypoint.sh /gobgp
RUN chmod +x /gobgp/entrypoint.sh

ENTRYPOINT ["/gobgp/entrypoint.sh"]
