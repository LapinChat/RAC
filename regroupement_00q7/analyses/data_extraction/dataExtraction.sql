-- Flight Logs
SELECT * FROM (
    SELECT 'Date', 'Pilote', 'Nom du quadcoptère', 'Temps de vol (s)', 'Météo', 'Endroit', 'Notes'
    UNION ALL
    (
        SELECT
            lf.log_date,
            CONCAT(u.firstname, ' ', u.lastname),
            q.name,
            lf.duration,
            lf.weather,
            l.name,
            IFNULL(lf.note, '')
        FROM logflight AS lf
            INNER JOIN quadcopter AS q ON lf.quadcopter_id = q.id
            INNER JOIN user AS u ON q.user_id = u.id
            INNER JOIN location AS l ON lf.location_id = l.id
    )
) results
INTO OUTFILE '/tmp/rac_flightlog.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Parts Logs
SELECT * FROM (
    SELECT 'Date', 'Pilote', 'Nom du quadcoptère', 'Nom de la pièce', 'Action', 'Notes'
    UNION ALL
    (
        SELECT
            lp.log_date,
            CONCAT(u.firstname, ' ', u.lastname),
            q.name,
            p.name,
            lpa.name,
            IFNULL(lp.note, '')
        FROM logpart AS lp
            INNER JOIN quadcopter AS q ON lp.quadcopter_id = q.id
            INNER JOIN user AS u ON q.user_id = u.id
            INNER JOIN part AS p ON lp.part_id = p.id
            INNER JOIN logpartaction AS lpa ON lp.logpartaction_id = lpa.id
    )
) results
INTO OUTFILE '/tmp/rac_partlog.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Parts
SELECT * FROM (
    SELECT 'Nom', 'Description', 'Type', 'Nom du quadcoptère', 'Propriétaire'
    UNION ALL
    (
        SELECT
            p.name,
            p.description,
            pt.name,
            q.name,
            CONCAT(u.firstname, ' ', u.lastname)
        FROM part AS p
            INNER JOIN parttype AS pt ON p.parttype_id = pt.id
            INNER JOIN quadcopter AS q ON p.quadcopter_id = q.id
            INNER JOIN user AS u ON q.user_id = u.id
    )
) results
INTO OUTFILE '/tmp/rac_part.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Quadcopter
SELECT * FROM (
    SELECT 'Nom', 'Description', 'Propriétaire', '# d\'enregistrement'
    UNION ALL
    (
        SELECT
            q.name,
            q.description,
            CONCAT(u.firstname, ' ', u.lastname),
            q.registration
        FROM quadcopter AS q
            INNER JOIN user AS u ON q.user_id = u.id
    )
) results
INTO OUTFILE '/tmp/rac_quadcopter.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User
SELECT * FROM (
    SELECT 'Nom', 'Role', 'Nom d\'utilisateur', 'Actif'
    UNION ALL
    (
        SELECT
            CONCAT(u.firstname, ' ', u.lastname),
            r.name,
            u.username,
            IF(u.is_active, 'oui', 'non')
        FROM user AS u
            INNER JOIN user_roles AS u_r ON u.id = u_r.user_id
            INNER JOIN role AS r ON u_r.role_id = r.id
    )
) results
INTO OUTFILE '/tmp/rac_user.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User(2) Portrait - ID
SELECT * FROM (
    SELECT 'Nom', 'Role', 'Nom d\'utilisateur', 'Actif'
    UNION ALL
    (
        SELECT
            CONCAT(u.firstname, ' ', u.lastname),
            r.name,
            u.username,
            IF(u.is_active, 'oui', 'non')
        FROM user AS u
            INNER JOIN user_roles AS u_r ON u.id = u_r.user_id
            INNER JOIN role AS r ON u_r.role_id = r.id
        WHERE u.id = 2
    )
) results
INTO OUTFILE '/tmp/rac_user_portrait_id.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User(2) Portrait - Addresses
SELECT * FROM (
    SELECT 'Type', 'Ligne 1', 'Ligne 2', 'Ligne 3', 'Ville', 'État/Région','Code zip/postal', 'Pays'
    UNION ALL
    (
        SELECT
            at.name,
            IFNULL(a.line1, ''),
            IFNULL(a.line2, ''),
            IFNULL(a.line3, ''),
            a.city,
            s.name,
            a.zip,
            c.name
        FROM address AS a
            INNER JOIN address_addresstypes AS a_at ON a.id = a_at.address_id
            INNER JOIN addresstype at ON a_at.addresstype_id = at.id
            INNER JOIN state AS s ON a.state_id = s.id
            INNER JOIN country AS c ON a.country_id = c.id
            INNER JOIN user_addresses AS u_a ON a.id = u_a.address_id
            INNER JOIN user AS u ON u_a.user_id = u.id
        WHERE
            u.id = 2
    )
) results
INTO OUTFILE '/tmp/rac_user_portrait_addresses.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User(2) Portrait - Quadcopters
SELECT * FROM (
    SELECT 'Nom', 'Description', '# d\'enregistrement'
    UNION ALL
    (
        SELECT
            q.name,
            q.description,
            q.registration
        FROM quadcopter AS q
            INNER JOIN user AS u ON q.user_id = u.id
        WHERE
            u.id = 2
    )
) results
INTO OUTFILE '/tmp/rac_user_portrait_quadcopters.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User(2) Portrait - Flight Logs
SELECT * FROM (
    SELECT 'Date', 'Nom du quadcoptère', 'Temps de vol (s)', 'Météo', 'Endroit', 'Notes'
    UNION ALL
    (
        SELECT
            lf.log_date,
            q.name,
            lf.duration,
            lf.weather,
            l.name,
            IFNULL(lf.note, '')
        FROM logflight AS lf
            INNER JOIN quadcopter AS q ON lf.quadcopter_id = q.id
            INNER JOIN user AS u ON q.user_id = u.id
            INNER JOIN location AS l ON lf.location_id = l.id
        WHERE
            u.id = 2
    )
) results
INTO OUTFILE '/tmp/rac_user_portrait_flightlogs.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User(2) Portrait - Part Logs
SELECT * FROM (
    SELECT 'Date', 'Nom du quadcoptère', 'Nom de la pièce', 'Action', 'Notes'
    UNION ALL
    (
    SELECT
        lp.log_date,
        q.name,
        p.name,
        lpa.name,
        IFNULL(lp.note, '')
    FROM logpart AS lp
        INNER JOIN quadcopter AS q ON lp.quadcopter_id = q.id
        INNER JOIN user AS u ON q.user_id = u.id
        INNER JOIN part AS p ON lp.part_id = p.id
        INNER JOIN logpartaction AS lpa ON lp.logpartaction_id = lpa.id
    WHERE
        u.id = 2
    )
) results
INTO OUTFILE '/tmp/rac_user_portrait_partlogs.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- User(2) Portrait - Own Parts
SELECT * FROM (
    SELECT 'Nom', 'Description', 'Type'
    UNION ALL
    (
    SELECT
        p.name,
        p.description,
        pt.name
    FROM part AS p
        INNER JOIN parttype AS pt ON p.parttype_id = pt.id
        INNER JOIN quadcopter AS q ON p.quadcopter_id = q.id
        INNER JOIN user AS u ON q.user_id = u.id
    WHERE
        u.id = 2
    )
) results
INTO OUTFILE '/tmp/rac_user_portrait_ownparts.csv'
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n';
