FROM golang:1.9

RUN mkdir -p /go/src/github.com/andream16/go-storm

ADD . /go/src/github.com/andream16/go-storm

RUN ls /go/src/github.com/andream16/go-storm

WORKDIR /go/src/github.com/andream16/go-storm

RUN curl -L https://api.github.com/repos/AndreaM16/go-storm/tarball | tar xz --strip=1

RUN go get -v