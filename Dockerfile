FROM frolvlad/alpine-glibc
COPY ./server /server
ENV GOROOT /usr/local/go

ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip /usr/local/go/lib/time/zoneinfo.zip

CMD ["/server"]
EXPOSE 8080