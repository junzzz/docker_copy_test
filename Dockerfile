FROM golang:1.8
WORKDIR /
COPY . .
ENV GOROOT /usr/local/go

ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip

CMD ["/server"]
EXPOSE 8080