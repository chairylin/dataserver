FROM golang:1.17-alpine

WORKDIR /opt/code/
ADD ./ /opt/code/

RUN apk update && apk upgrade && \
    apk add --no-cache git

RUN go mod download

RUN go build -o bin/dataserver cmd/dataserver/main.go
ENTRYPOINT ["bin/dataserver"]