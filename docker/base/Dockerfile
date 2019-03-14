### Dockerfile
#
#   See https://github.com/russmckendrick/docker

FROM alpine:latest
MAINTAINER Michael Brewster

RUN apk update && apk upgrade && \
	apk add ca-certificates bash && \
	rm -rf /var/cache/apk/*