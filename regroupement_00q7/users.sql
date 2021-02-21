-- DROP privilege: dropper la db
-- CREATE USER privilege: creer des users
    -- ou INSERT

-- Roles definitions
-- -----------------

CREATE OR REPLACE ROLE rac_admin_role;
GRANT
    GRANT OPTION, CREATE ROUTINE, CREATE TEMPORARY TABLES, EVENT, LOCK TABLES
    ON regroupement00q7
    TO rac_admin_role;
GRANT
    GRANT OPTION, ALTER, CREATE, DELETE, DROP, INDEX, INSERT, SELECT, TRIGGER, UPDATE
    ON regroupement00q7.*
    TO rac_admin_role;
GRANT
    GRANT OPTION, EXECUTE, ALTER ROUTINE
    ON PROCEDURE get_role_permissions
    TO rac_admin_role;


CREATE OR REPLACE ROLE rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.user
    TO rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.address
    TO rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.location
    TO rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.logflight
    TO rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.logpart
    TO rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.part
    TO rac_pilot_role;
GRANT
    DELETE, INDEX, INSERT, SELECT, UPDATE
    ON regroupement00q7.quadcopter
    TO rac_pilot_role;


CREATE OR REPLACE ROLE rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.user
    TO rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.address
    TO rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.location
    TO rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.logflight
    TO rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.logpart
    TO rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.part
    TO rac_autority_role;
GRANT
    SELECT
    ON regroupement00q7.quadcopter
    TO rac_autority_role;

-- Users creation
-- --------------

-- Admins
CREATE OR REPLACE USER rac_admin_a@localhost IDENTIFIED BY PASSWORD 'supersecret';
    GRANT rac_admin_role TO rac_admin_b@localhost;
    SET DEFAULT ROLE rac_admin_role FOR rac_admin_a@localhost;

CREATE OR REPLACE USER rac_admin_b@localhost IDENTIFIED BY PASSWORD 'supersecret';
    GRANT rac_admin_role TO rac_admin_b@localhost;
    SET DEFAULT ROLE rac_admin_role FOR rac_admin_b@localhost;

-- Pilots
CREATE OR REPLACE USER rac_pilot_a@localhost IDENTIFIED BY PASSWORD 'supersecret';
    GRANT rac_pilot_role TO rac_pilot_a@localhost;
    SET DEFAULT ROLE rac_pilot_role FOR rac_pilot_a@localhost;

CREATE OR REPLACE USER rac_pilot_b@localhost IDENTIFIED BY PASSWORD 'supersecret';
    GRANT rac_pilot_role TO rac_pilot_b@localhost;
    SET DEFAULT ROLE rac_pilot_role FOR rac_pilot_b@localhost;

-- Autorities
CREATE OR REPLACE USER rac_autority_a@localhost IDENTIFIED BY PASSWORD 'supersecret';
    GRANT rac_autority_role TO rac_autority_a@localhost;
    SET DEFAULT ROLE rac_autority_role FOR rac_autority_a@localhost;

CREATE OR REPLACE USER rac_autority_b@localhost IDENTIFIED BY PASSWORD 'supersecret';
    GRANT rac_autority_role TO rac_autority_b@localhost;
    SET DEFAULT ROLE rac_autority_role FOR rac_autority_b@localhost;


-- Application user creation and definition
-- ----------------------------------------
CREATE OR REPLACE USER application@localhost IDENTIFIED BY PASSWORD 'appsupersecret';
    GRANT rac_admin_role TO rac_application@localhost;
    SET DEFAULT ROLE rac_admin_role FOR rac_application@localhost;
