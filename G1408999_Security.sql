USE NHS_Database;

CREATE ROLE Administrator;
CREATE ROLE Doctor;
CREATE ROLE Receptionist;
CREATE ROLE Patient;

GRANT ALL PRIVILEGES
ON NHS_Database.*
TO Administrator;

GRANT SELECT, UPDATE
ON NHS_Database.*
TO Doctor;

GRANT SELECT, INSERT
ON NHS_Database.*
TO Receptionist;

GRANT SELECT
ON NHS_Database.*
TO Patient;

USE NHS_Database;

ALTER TABLE Patient
ADD PasswordHash VARCHAR(255);

UPDATE Patient
SET PasswordHash = SHA2('Patient123!', 256)
WHERE PatientID > 0;

SELECT
    PatientID,
    PatientName,
    PasswordHash
FROM Patient;