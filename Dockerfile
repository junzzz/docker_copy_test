FROM scratch
WORKDIR /
COPY ./server /tmp/server
ENV GOROOT /usr/local/go

ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip

CMD ["/tmp/server"]
EXPOSE 8080