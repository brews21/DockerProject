FROM postgres:latest

# COPY . .

ENV POSTGRES_PASSWORD postgres

COPY scripts/*.sql docker-entrypoint-initdb.d/

EXPOSE 5432
CMD ["postgres"]
