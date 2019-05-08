FROM golang:1.9.2

ENV DEP_URL="https://github.com/golang/dep/releases/download/v0.5.0/dep-linux-amd64"
ENV GOPATH=/go

COPY src/ /go/src/github.com/newrelic/dispatch

WORKDIR /go/src/github.com/newrelic/dispatch

RUN \
	curl -fsSL -o /usr/local/bin/dep ${DEP_URL} && \
	chmod +x /usr/local/bin/dep && \
	dep ensure && \
	go build -o bin/gorcv

CMD bin/gorcv
