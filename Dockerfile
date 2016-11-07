FROM alpine
MAINTAINER ant <git@manchestermonkey.co.uk>



RUN apk --no-cache add bash nmap nmap-scripts \
	&& mkdir /data

ADD go.sh go.sh


ENTRYPOINT [ "/go.sh" ]

