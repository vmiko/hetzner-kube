# Builder stage
FROM ubuntu:20.04 as hetzner-kube
ENV HETZNER_KUBE_VERSION=0.5.1
RUN apt update -y && apt install -y wget; \
  wget https://github.com/xetys/hetzner-kube/releases/download/${HETZNER_KUBE_VERSION}/hetzner-kube-${HETZNER_KUBE_VERSION}-linux-amd64 -O /usr/local/bin/hetzner-kube; \
  chmod +x /usr/local/bin/hetzner-kube;

# Final stage
FROM alpine

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL maintainer="Victor Mikolajczyk <victor.miko.vm@gmail.com>"

LABEL org.opencontainers.image.title="vmiko/hetzner-kube" \
      org.opencontainers.image.url="https://github.com/xetys/hetzner-kube" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.source="https://github.com/vmiko/hetzner-kube" \
      org.opencontainers.image.created=$BUILD_DATE

COPY --from=hetzner-kube /usr/local/bin/hetzner-kube /usr/local/bin

ENTRYPOINT ["hetzner-kube"]
CMD ["help"]
