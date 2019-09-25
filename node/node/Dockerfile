ARG dev
FROM nodebase:$dev
MAINTAINER Michael Brewster

ARG env
ENV environment $env

ARG app
ENV app_name $app

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

RUN unzip app.zip -d ./

RUN chmod -R 775 npmInstalls.sh && \
  ./npmInstalls.sh

WORKDIR /usr/src/app/app
EXPOSE 3000
ENTRYPOINT [ "npm", "run", "dev" ]
