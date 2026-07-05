CREATE DATABASE NHS_Database;
USE NHS_Database;

CREATE TABLE Clinic (
    ClinicID INT AUTO_INCREMENT PRIMARY KEY,
    ClinicName VARCHAR(100) NOT NULL,
    ClinicAddress VARCHAR(255) NOT NULL
);
CREATE TABLE Patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);
CREATE TABLE Doctor (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Speciality VARCHAR(100) NOT NULL,
    ClinicID INT NOT NULL,
    FOREIGN KEY (ClinicID) REFERENCES Clinic(ClinicID)
);
CREATE TABLE Medication (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(100) NOT NULL
);
CREATE TABLE Appointment (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Notes VARCHAR(255),

    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
CREATE TABLE Appointment_Medication (
    AppointmentID INT NOT NULL,
    MedicationID INT NOT NULL,

    PRIMARY KEY (AppointmentID, MedicationID),

    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
    FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID)
);