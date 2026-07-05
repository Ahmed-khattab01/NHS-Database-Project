USE NHS_Database;

INSERT INTO Clinic (ClinicName, ClinicAddress)
VALUES
('Central Health Clinic', '10 Main Street, London'),
('Riverside Medical Centre', '22 River Road, London'),
('North Care Clinic', '15 North Avenue, London'),
('South Family Clinic', '44 South Road, London'),
('West London Clinic', '88 Oxford Street, London'),
('East Medical Centre', '9 East Lane, London'),
('Green Park Clinic', '30 Green Park Road, London'),
('City Health Centre', '77 King Street, London'),
('Victoria Clinic', '12 Victoria Road, London'),
('Bridge Medical Centre', '50 Bridge Street, London');
SELECT * FROM Clinic;

INSERT INTO Patient (PatientName, Gender, Address, DateOfBirth, Email, PhoneNumber)
VALUES
('John Smith', 'Male', '123 Hill Road, London', '1985-03-15', 'john.smith@email.com', '07111111111'),
('Mary Jones', 'Female', '456 Lake Avenue, London', '1992-07-21', 'mary.jones@email.com', '07222222222'),
('James Wilson', 'Male', '78 Green Street, London', '1978-11-05', 'james.wilson@email.com', '07333333333'),
('Sarah Brown', 'Female', '12 Park Lane, London', '1995-01-18', 'sarah.brown@email.com', '07444444444'),
('David Taylor', 'Male', '55 King Road, London', '1980-09-10', 'david.taylor@email.com', '07555555555'),
('Emma White', 'Female', '9 Queen Street, London', '1998-04-30', 'emma.white@email.com', '07666666666'),
('Michael Green', 'Male', '81 Oxford Road, London', '1987-12-12', 'michael.green@email.com', '07777777777'),
('Olivia Harris', 'Female', '16 River Lane, London', '1990-06-09', 'olivia.harris@email.com', '07888888888'),
('Daniel Clark', 'Male', '200 Bridge Street, London', '1983-02-25', 'daniel.clark@email.com', '07999999999'),
('Sophia Lewis', 'Female', '42 Victoria Road, London', '1997-08-14', 'sophia.lewis@email.com', '07000000000');
SELECT * FROM patient;

INSERT INTO Doctor (DoctorName, Speciality, ClinicID)
VALUES
('Dr. Adams', 'Cardiology', 1),
('Dr. Brown', 'General Practice', 2),
('Dr. Wilson', 'Dermatology', 3),
('Dr. Taylor', 'Orthopaedics', 4),
('Dr. Johnson', 'Neurology', 5),
('Dr. Evans', 'Paediatrics', 6),
('Dr. Harris', 'Radiology', 7),
('Dr. Lewis', 'Oncology', 8),
('Dr. Walker', 'Psychiatry', 9),
('Dr. Scott', 'ENT', 10);
SELECT * FROM Doctor;

INSERT INTO Medication (MedicationName)
VALUES
('Aspirin'),
('Paracetamol'),
('Ibuprofen'),
('Amoxicillin'),
('Metformin'),
('Atorvastatin'),
('Omeprazole'),
('Salbutamol'),
('Insulin'),
('Vitamin D');
SELECT * FROM Medication;

INSERT INTO Appointment
(PatientID, DoctorID, AppointmentDate, AppointmentTime, Notes)
VALUES
(1,1,'2024-05-01','10:00:00','Follow-up in 2 weeks'),
(2,2,'2024-05-03','09:00:00','First visit'),
(3,3,'2024-05-05','11:30:00','Skin rash review'),
(4,4,'2024-05-06','14:00:00','Knee pain'),
(5,5,'2024-05-08','13:30:00','Migraine assessment'),
(6,6,'2024-05-09','10:15:00','Routine check'),
(7,7,'2024-05-10','15:45:00','X-ray review'),
(8,8,'2024-05-11','09:30:00','Cancer consultation'),
(9,9,'2024-05-12','16:00:00','Mental health review'),
(10,10,'2024-05-13','11:00:00','Ear infection');
SELECT * FROM appointment;

INSERT INTO Appointment_Medication
(AppointmentID, MedicationID)
VALUES
(1,1),
(1,6),
(2,2),
(3,3),
(4,3),
(5,2),
(5,7),
(6,10),
(7,3),
(8,4),
(8,6),
(9,7),
(10,4),
(10,2),
(2,10);
SELECT * FROM appointment_medication;