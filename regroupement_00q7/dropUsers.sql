-- Drop Admins
SET DEFAULT ROLE NONE FOR rac_admin_a@localhost;
SET DEFAULT ROLE NONE FOR rac_admin_b@localhost;
DROP ROLE IF EXISTS rac_admin_role;

DROP USER IF EXISTS rac_admin_a@localhost;
DROP USER IF EXISTS rac_admin_b@localhost;

-- Drop Pilots
SET DEFAULT ROLE NONE FOR rac_pilot_a@localhost;
SET DEFAULT ROLE NONE FOR rac_pilot_b@localhost;
DROP ROLE IF EXISTS rac_pilot_role;

DROP USER IF EXISTS rac_pilot_a@localhost;
DROP USER IF EXISTS rac_pilot_b@localhost;

-- Drop Authorities
SET DEFAULT ROLE NONE FOR rac_authority_a@localhost;
SET DEFAULT ROLE NONE FOR rac_authority_b@localhost;
DROP ROLE IF EXISTS rac_authority_role;

DROP USER IF EXISTS rac_authority_a@localhost;
DROP USER IF EXISTS rac_authority_b@localhost;

-- Drop Applications
SET DEFAULT ROLE NONE FOR rac_application@localhost;
DROP ROLE IF EXISTS rac_application_role;

DROP USER IF EXISTS rac_application@localhost;