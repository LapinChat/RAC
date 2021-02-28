-- -----------------------
-- USERS AND ROLES DEFINITIONS
-- -----------------------


-- Roles definitions
-- -----------------

-- Admin
CREATE OR REPLACE ROLE rac_admin_role;
GRANT
    GRANT OPTION, CREATE ROUTINE, CREATE TEMPORARY TABLES, EVENT, LOCK TABLES, ALTER, CREATE, DELETE, DROP, INDEX, INSERT, SELECT, TRIGGER, UPDATE
    ON regroupement00q7.*
    TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_role_permissions TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_address TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_addresstype TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_country TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_location TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_logflight TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_logpart TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_logpartaction TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_part TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_parttype TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_permission TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_quadcopter TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_role TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_roles_permissions TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_state TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_user TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_user_addresses TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_user_roles TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_quadcopters TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_most_recent_flight_log TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_oldest_flight_log TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_permissions TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_permissions_contains TO rac_admin_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_users_flight_logs_average TO rac_admin_role;

-- Application
CREATE OR REPLACE ROLE rac_application_role;
GRANT
    GRANT OPTION, CREATE ROUTINE, CREATE TEMPORARY TABLES, EVENT, LOCK TABLES, ALTER, CREATE, DELETE, DROP, INDEX, INSERT, SELECT, TRIGGER, UPDATE
        ON regroupement00q7.*
    TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_role_permissions TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_address TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_addresstype TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_country TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_location TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_logflight TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_logpart TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_logpartaction TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_part TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_parttype TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_permission TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_quadcopter TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_role TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_roles_permissions TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_state TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_user TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_user_addresses TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE count_user_roles TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_quadcopters TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_most_recent_flight_log TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_oldest_flight_log TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_permissions TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_user_permissions_contains TO rac_application_role;
GRANT EXECUTE, GRANT OPTION, ALTER ROUTINE ON PROCEDURE get_users_flight_logs_average TO rac_application_role;

-- Pilot
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

-- Authority
CREATE OR REPLACE ROLE rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.user
    TO rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.address
    TO rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.location
    TO rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.logflight
    TO rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.logpart
    TO rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.part
    TO rac_authority_role;
GRANT
    SELECT
    ON regroupement00q7.quadcopter
    TO rac_authority_role;

-- Users creation
-- --------------

-- Admins
CREATE OR REPLACE USER rac_admin_a@localhost IDENTIFIED BY 'supersecret';
    GRANT rac_admin_role TO rac_admin_a@localhost;
    SET DEFAULT ROLE rac_admin_role FOR rac_admin_a@localhost;

CREATE OR REPLACE USER rac_admin_b@localhost IDENTIFIED BY 'supersecret';
    GRANT rac_admin_role TO rac_admin_b@localhost;
    SET DEFAULT ROLE rac_admin_role FOR rac_admin_b@localhost;

-- Pilots
CREATE OR REPLACE USER rac_pilot_a@localhost IDENTIFIED BY 'supersecret';
    GRANT rac_pilot_role TO rac_pilot_a@localhost;
    SET DEFAULT ROLE rac_pilot_role FOR rac_pilot_a@localhost;

CREATE OR REPLACE USER rac_pilot_b@localhost IDENTIFIED BY 'supersecret';
    GRANT rac_pilot_role TO rac_pilot_b@localhost;
    SET DEFAULT ROLE rac_pilot_role FOR rac_pilot_b@localhost;

-- Autorities
CREATE OR REPLACE USER rac_authority_a@localhost IDENTIFIED BY 'supersecret';
    GRANT rac_authority_role TO rac_authority_a@localhost;
    SET DEFAULT ROLE rac_authority_role FOR rac_authority_a@localhost;

CREATE OR REPLACE USER rac_authority_b@localhost IDENTIFIED BY 'supersecret';
    GRANT rac_authority_role TO rac_authority_b@localhost;
    SET DEFAULT ROLE rac_authority_role FOR rac_authority_b@localhost;


-- Application user creation and definition
-- ----------------------------------------
CREATE OR REPLACE USER rac_application@localhost IDENTIFIED BY 'appsupersecret';
    GRANT rac_application_role TO rac_application@localhost;
    SET DEFAULT ROLE rac_application_role FOR rac_application@localhost;
