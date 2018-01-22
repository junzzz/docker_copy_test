FROM scratch
WORKDIR /
COPY . .
ENV GOROOT /usr/local/go

ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip

ENTRYPOINT ["/server"]
EXPOSE 8080