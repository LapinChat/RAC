USE regroupement00q7;

DROP PROCEDURE IF EXISTS get_role_permissions;

DROP PROCEDURE IF EXISTS count_address;
DROP PROCEDURE IF EXISTS count_addresstype;
DROP PROCEDURE IF EXISTS count_country;
DROP PROCEDURE IF EXISTS count_location;
DROP PROCEDURE IF EXISTS count_logflight;
DROP PROCEDURE IF EXISTS count_logpart;
DROP PROCEDURE IF EXISTS count_logpartaction;
DROP PROCEDURE IF EXISTS count_part;
DROP PROCEDURE IF EXISTS count_parttype;
DROP PROCEDURE IF EXISTS count_permission;
DROP PROCEDURE IF EXISTS count_quadcopter;
DROP PROCEDURE IF EXISTS count_role;
DROP PROCEDURE IF EXISTS count_roles_permissions;
DROP PROCEDURE IF EXISTS count_state;
DROP PROCEDURE IF EXISTS count_user;
DROP PROCEDURE IF EXISTS count_user_addresses;
DROP PROCEDURE IF EXISTS count_user_roles;

DROP PROCEDURE IF EXISTS get_user_quadcopters;
DROP PROCEDURE IF EXISTS get_user_most_recent_flight_log;
DROP PROCEDURE IF EXISTS get_user_oldest_flight_log;
DROP PROCEDURE IF EXISTS get_user_permissions;
DROP PROCEDURE IF EXISTS get_user_permissions_contains;
DROP PROCEDURE IF EXISTS get_users_flight_logs_average;

DROP PROCEDURE IF EXISTS user_modify_address;