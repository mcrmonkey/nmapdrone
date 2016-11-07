FROM alpine:3.3
MAINTAINER ant <git@manchestermonkey.co.uk>

RUN apk --no-cache add bash nmap nmap-scripts python \
	&& mkdir /data

ADD go.sh go.sh

ENTRYPOINT [ "/go.sh" ]
