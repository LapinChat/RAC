USE regroupement00q7;

-- get_role_permissions(string role_name)
DELIMITER //

CREATE OR REPLACE PROCEDURE get_role_permissions(
    IN role_name VARCHAR(255)
) BEGIN
    SELECT
        p.name
    FROM role AS r
        INNER JOIN roles_permissions AS rp ON r.id = rp.role_id
        INNER JOIN permission AS p ON rp.permission_id = p.id
    WHERE
        r.name = role_name;
END //

-- COUNT TABLES ENTRIES
CREATE OR REPLACE PROCEDURE count_address()
BEGIN
    SELECT COUNT(*) FROM address;
END //

CREATE OR REPLACE PROCEDURE count_addresstype()
BEGIN
    SELECT COUNT(*) FROM addresstype;
END //

CREATE OR REPLACE PROCEDURE count_country()
BEGIN
    SELECT COUNT(*) FROM country;
END //

CREATE OR REPLACE PROCEDURE count_location()
BEGIN
    SELECT COUNT(*) FROM location;
END //

CREATE OR REPLACE PROCEDURE count_logflight()
BEGIN
    SELECT COUNT(*) FROM logflight;
END //

CREATE OR REPLACE PROCEDURE count_logpart()
BEGIN
    SELECT COUNT(*) FROM logpart;
END //

CREATE OR REPLACE PROCEDURE count_logpartaction()
BEGIN
    SELECT COUNT(*) FROM logpartaction;
END //

CREATE OR REPLACE PROCEDURE count_part()
BEGIN
    SELECT COUNT(*) FROM part;
END //

CREATE OR REPLACE PROCEDURE count_parttype()
BEGIN
    SELECT COUNT(*) FROM parttype;
END //

CREATE OR REPLACE PROCEDURE count_permission()
BEGIN
    SELECT COUNT(*) FROM permission;
END //

CREATE OR REPLACE PROCEDURE count_quadcopter()
BEGIN
    SELECT COUNT(*) FROM quadcopter;
END //

CREATE OR REPLACE PROCEDURE count_role()
BEGIN
    SELECT COUNT(*) FROM role;
END //

CREATE OR REPLACE PROCEDURE count_state()
BEGIN
    SELECT COUNT(*) FROM state;
END //

CREATE OR REPLACE PROCEDURE count_user()
BEGIN
    SELECT COUNT(*) FROM user;
END //

-- COUNT TABLES ENTRIES - JOINT TABLES
CREATE OR REPLACE PROCEDURE count_address_addresstypes()
BEGIN
    SELECT COUNT(*) FROM address_addresstypes;
END //

CREATE OR REPLACE PROCEDURE count_roles_permissions()
BEGIN
    SELECT COUNT(id) FROM roles_permissions;
END //

CREATE OR REPLACE PROCEDURE count_user_addresses()
BEGIN
    SELECT COUNT(id) FROM user_addresses;
END //

CREATE OR REPLACE PROCEDURE count_user_roles()
BEGIN
    SELECT COUNT(id) FROM user_roles;
END //

DELIMITER ;