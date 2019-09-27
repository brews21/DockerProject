FROM postgres:latest

# COPY . .

ENV POSTGRES_PASSWORD password

WORKDIR /tmp
COPY . .

#COPY scripts/01_createDB.sql docker-entrypoint-initdb.d/

EXPOSE 5432
CMD ["postgres"]
