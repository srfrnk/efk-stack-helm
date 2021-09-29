FROM alpine

RUN apk add curl

COPY ./initializer.sh ./initializer.sh

USER 1000

ENTRYPOINT [ "./initializer.sh" ]
