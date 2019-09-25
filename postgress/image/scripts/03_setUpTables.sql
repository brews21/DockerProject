CREATE TABLE common.account(
   user_id serial PRIMARY KEY,
   username VARCHAR (50) UNIQUE NOT NULL,
   password VARCHAR (50) NOT NULL,
   email VARCHAR (355) UNIQUE NOT NULL,
   created_on TIMESTAMP NOT NULL,
   last_login TIMESTAMP,
   build_status VARCHAR (50),
   infra_status VARCHAR (50)
);

CREATE TABLE common.role(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE common.account_role
(
  user_id integer NOT NULL,
  role_id integer NOT NULL,
  grant_date timestamp without time zone,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id)
      REFERENCES common.role (role_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES common.account (user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA common TO dbadmin;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA common TO dbadmin;
ALTER DEFAULT PRIVILEGES FOR ROLE dbadmin IN SCHEMA common GRANT ALL PRIVILEGES ON TABLES to dbadmin;
ALTER DEFAULT PRIVILEGES FOR ROLE dbadmin IN SCHEMA common GRANT ALL PRIVILEGES ON FUNCTIONS to dbadmin;

GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA common TO dbadmin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA common TO dbadmin;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA common TO dbadmin;
