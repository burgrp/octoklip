FROM alpine:3.14

RUN cat /etc/apk/repositories | grep main | sed s/\\/[^\\/]*\\/main/\\/edge\\/testing/ >>/etc/apk/repositories
RUN apk update
RUN apk add motion

COPY motion.conf /etc/motion.conf

CMD motion -c /etc/motion.conf