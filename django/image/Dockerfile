### Dockerfile
#
#   See https://github.com/russmckendrick/docker

ARG dev

FROM ubuntubase:$dev
MAINTAINER Michael Brewster

ARG env
ENV environment $env

ARG app
ENV app_name $app

WORKDIR /apps/django

COPY delivered_files/ .

WORKDIR /tmp/scripts

COPY . .

RUN chmod 755 -R ./

RUN apt-get update \
  && apt-get install -y \
  && apt-get install python3-pip -y \
  && python3 -m pip install --upgrade pip \
  && python3 -m pip install django psycopg2_binary
  #&& ./tmp/scripts/init/init.sh

WORKDIR /apps/django/portfolioSite/server

ENTRYPOINT ["/tmp/scripts/init/init.sh"]
#CMD ["/tmp/scripts/init/init.sh"]
CMD ["/bin/bash"]
