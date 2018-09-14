# Build concourse smuggler
FROM golang:1.9-alpine
RUN apk add -U git && rm -rf /var/cache/apk/*
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
        go get github.com/redfactorlabs/concourse-smuggler-resource

# Modify the upstream resource
FROM concourse/pool-resource

# Add the smuggler binary compiled previously
COPY --from=0 /go/bin/concourse-smuggler-resource /opt/resource/smuggler

RUN mkdir -p /opt/resource/wrapped/pool
RUN mv /opt/resource/check /opt/resource/wrapped/pool/
RUN mv /opt/resource/in /opt/resource/wrapped/pool/
RUN mv /opt/resource/out /opt/resource/wrapped/pool/

# Link the /opt/resource{check,in,out} commands to smuggler
RUN ln /opt/resource/smuggler /opt/resource/check \
    && ln /opt/resource/smuggler /opt/resource/in \
    && ln /opt/resource/smuggler /opt/resource/out

# Add the config file for this resource
ADD ./smuggler.yml /opt/resource/

ENV PACKAGES "jq"
RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
