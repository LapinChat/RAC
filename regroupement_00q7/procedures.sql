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

-- User permissions
CREATE OR REPLACE PROCEDURE get_user_permissions(
    IN from_user_id BIGINT UNSIGNED
) BEGIN
    SELECT
        p.name
    FROM user AS u
        INNER JOIN user_roles AS ur ON u.id = ur.user_id
        INNER JOIN roles_permissions AS rp ON ur.role_id = rp.role_id
        INNER JOIN permission AS p ON rp.permission_id = p.id
    WHERE
        u.id = from_user_id;
END //

-- User Read permissions
CREATE OR REPLACE PROCEDURE get_user_permissions_contains(
    IN from_user_id BIGINT UNSIGNED,
    IN regexp_string VARCHAR(255)
) BEGIN
    SELECT
        p.name
    FROM user AS u
        INNER JOIN user_roles AS ur ON u.id = ur.user_id
        INNER JOIN roles_permissions AS rp ON ur.role_id = rp.role_id
        INNER JOIN permission AS p ON rp.permission_id = p.id
    WHERE
        u.id = from_user_id
        AND p.name REGEXP regexp_string;
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
    SELECT COUNT(*) FROM roles_permissions;
END //

CREATE OR REPLACE PROCEDURE count_user_addresses()
BEGIN
    SELECT COUNT(*) FROM user_addresses;
END //

CREATE OR REPLACE PROCEDURE count_user_roles()
BEGIN
    SELECT COUNT(*) FROM user_roles;
END //

-- User list of quadcopters
CREATE OR REPLACE PROCEDURE get_user_quadcopters(
    IN from_user_id BIGINT UNSIGNED
) BEGIN
    SELECT
        *
    FROM
         quadcopter
    WHERE
        user_id = from_user_id;
END //

-- User most recent flight log
CREATE OR REPLACE PROCEDURE get_user_most_recent_flight_log(
    IN from_user_id BIGINT UNSIGNED
) BEGIN
    SELECT
        *
    FROM logflight AS l
        INNER JOIN quadcopter AS q ON l.quadcopter_id = q.id
        WHERE q.user_id = from_user_id
    ORDER BY l.log_date DESC
    LIMIT 1;
END //

-- User oldest flight log
CREATE OR REPLACE PROCEDURE get_user_oldest_flight_log(
    IN from_user_id BIGINT UNSIGNED
) BEGIN
    SELECT
        *
    FROM logflight AS l
        INNER JOIN quadcopter AS q ON l.quadcopter_id = q.id
    WHERE q.user_id = from_user_id
    ORDER BY l.log_date ASC
    LIMIT 1;
END //

-- User get flight log from last days
CREATE OR REPLACE PROCEDURE get_users_flight_logs_average(
    IN comparison VARCHAR(2),
    IN flight_time_seconds INT UNSIGNED
) BEGIN
    SELECT
        u.firstname,
        u.lastname,
        AVG(l.duration)
    FROM logflight AS l
        INNER JOIN quadcopter AS q ON l.quadcopter_id = q.id
        JOIN user AS u ON u.id = q.user_id
    GROUP BY u.firstname, u.lastname
    HAVING
        (AVG(l.duration) >= flight_time_seconds AND comparison='>=')
        OR (AVG(l.duration) > flight_time_seconds AND comparison='>')
        OR (AVG(l.duration) = flight_time_seconds AND comparison='=')
        OR (AVG(l.duration) < flight_time_seconds AND comparison='<')
        OR (AVG(l.duration) <= flight_time_seconds AND comparison='<=');
END //

-- User modify an address
CREATE OR REPLACE PROCEDURE user_modify_address(
    IN target_user_id BIGINT UNSIGNED,
    IN target_address_id BIGINT UNSIGNED,
    IN new_line1 VARCHAR(255),
    IN new_line2 VARCHAR(255),
    IN new_line3 VARCHAR(255),
    IN new_city VARCHAR(255),
    IN new_zip VARCHAR(255),
    IN new_country_id BIGINT UNSIGNED,
    IN new_state_id BIGINT UNSIGNED
) BEGIN
    UPDATE address AS a
        INNER JOIN user_addresses ua ON a.id = ua.address_id
    SET
        a.line1 = new_line1,
        a.line2 = new_line2,
        a.line3 = new_line3,
        a.city = new_city,
        a.zip = new_zip,
        a.country_id = new_country_id,
        a.state_id = new_state_id
    WHERE
        a.id = target_address_id
        AND ua.user_id = target_user_id ;
END //

-- User delete address
CREATE OR REPLACE PROCEDURE user_delete_address(
    IN target_user_id BIGINT UNSIGNED,
    IN target_address_id BIGINT UNSIGNED
) BEGIN
    IF EXISTS(
        SELECT * FROM user_addresses WHERE user_id = target_user_id AND address_id = target_address_id
        )
    THEN
        DELETE FROM
            user_addresses
        WHERE
            user_id = target_user_id
            AND address_id = target_address_id;
        DELETE FROM
            address_addresstypes
        WHERE
            address_id = target_address_id;
        DELETE FROM
            address
        WHERE
            id = target_address_id;
    END IF;
END //

-- Part Logs
CREATE OR REPLACE PROCEDURE logpart_get_action_count(
    IN log_type VARCHAR(255)
)
BEGIN
    SELECT
        COUNT(lp.id)
    FROM logpart AS lp
        INNER JOIN logpartaction lpa ON lp.logpartaction_id = lpa.id
    WHERE lpa.name = log_type;
END //

DELIMITER ;