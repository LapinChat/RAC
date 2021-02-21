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

DELIMITER ;