FROM alpine:latest

RUN apk update && apk upgrade

RUN apk --no-cache add openjdk11

CMD ["java","--version"]