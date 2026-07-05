USE NHS_Database;

-- ===========================================
-- Query 1: Aggregate Function (COUNT)
-- Counts the total number of patients
-- ===========================================

SELECT
    COUNT(*) AS TotalPatients
FROM Patient;

USE NHS_Database;

-- ===========================================
-- Query 2: INNER JOIN
-- Displays patients with their doctors and appointments
-- ===========================================

SELECT
    Appointment.AppointmentID,
    Patient.PatientName,
    Doctor.DoctorName,
    Appointment.AppointmentDate,
    Appointment.AppointmentTime
FROM Appointment
INNER JOIN Patient
    ON Appointment.PatientID = Patient.PatientID
INNER JOIN Doctor
    ON Appointment.DoctorID = Doctor.DoctorID;
    
   USE NHS_Database;
   
   -- ===========================================
-- Query 3: Stored Procedure
-- Returns all appointments for a selected patient
-- ===========================================

DELIMITER $$

CREATE PROCEDURE GetPatientAppointments(IN Patient_ID INT)
BEGIN
    SELECT
        Appointment.AppointmentID,
        Patient.PatientName,
        Doctor.DoctorName,
        Appointment.AppointmentDate,
        Appointment.AppointmentTime,
        Appointment.Notes
    FROM Appointment
    INNER JOIN Patient
        ON Appointment.PatientID = Patient.PatientID
    INNER JOIN Doctor
        ON Appointment.DoctorID = Doctor.DoctorID
    WHERE Patient.PatientID = Patient_ID;
END$$

-- ===========================================
-- Query 4: Trigger
-- Automatically adds a default note when none is entered
-- ===========================================

DELIMITER ; 
CALL GetPatientAppointments(1);

USE NHS_Database;

DELIMITER $$

CREATE TRIGGER BeforeAppointmentInsert
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.Notes IS NULL OR NEW.Notes = '' THEN
        SET NEW.Notes = 'Appointment Created';
    END IF;
END$$

DELIMITER ;

INSERT INTO Appointment
(PatientID, DoctorID, AppointmentDate, AppointmentTime)

VALUES
(1, 1, '2026-08-01', '10:00:00');

SELECT *
FROM Appointment
ORDER BY AppointmentID DESC
LIMIT 1;

USE NHS_Database;

-- ===========================================
-- Query 5: GROUP BY and HAVING
-- Counts appointments for each doctor
-- ===========================================

SELECT
    Doctor.DoctorName,
    COUNT(Appointment.AppointmentID) AS TotalAppointments
FROM Doctor
INNER JOIN Appointment
    ON Doctor.DoctorID = Appointment.DoctorID
GROUP BY Doctor.DoctorName
HAVING COUNT(Appointment.AppointmentID) >= 1
ORDER BY TotalAppointments DESC;