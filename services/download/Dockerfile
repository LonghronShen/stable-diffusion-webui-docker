FROM bash:alpine3.15

ARG HTTPS_PROXY
ARG HTTP_PROXY

ENV HTTPS_PROXY=${HTTPS_PROXY}
ENV HTTP_PROXY=${HTTP_PROXY}

RUN apk add parallel aria2
COPY . /docker
RUN chmod +x /docker/download.sh
ENTRYPOINT ["/docker/download.sh"]
