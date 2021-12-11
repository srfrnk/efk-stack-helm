FROM alpine

RUN apk add --update curl

COPY ./initializer.sh ./initializer.sh

USER 1000

ENTRYPOINT [ "./initializer.sh" ]
