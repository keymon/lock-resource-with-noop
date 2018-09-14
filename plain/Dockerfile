# Modify the upstream resource
FROM concourse/pool-resource

RUN mkdir -p /opt/resource/wrapped/pool
RUN mv /opt/resource/in /opt/resource/wrapped/pool/

ADD ./in.sh /opt/resource/in

ENV PACKAGES "jq"
RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
