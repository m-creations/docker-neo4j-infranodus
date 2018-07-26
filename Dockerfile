## -*- docker-image-name: "mcreations/neo4j-infranode" -*-

FROM mcreations/neo4j:3.4.4

LABEL maintainer="Kambiz Darabi <darabi@m-creations.net>"
LABEL vendor="mcreations"

ADD image/root /

