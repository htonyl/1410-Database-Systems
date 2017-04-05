USE hospital;

-- Select all patients, then order by date of birth:
SELECT Name, PatientID as 'Patient ID', Birth as 'Date of Birth', Gender FROM Patient
ORDER BY Birth;

-- Inner join on Patient and Hospitalization to show all patients that have been hospitalized:
SELECT Patient.Name, Patient.PatientID as 'Patient ID', Hospitalization.Room_RoomID as 'Room #', Hospitalization.AdmissionDate, Hospitalization.ReleaseDate , Patient.Birth as 'Date of Birth', Patient.Gender 
FROM Patient
INNER JOIN Hospitalization
ON Hospitalization.Patient_PatientID=Patient.PatientID;

-- Count number of patients per gender
Select Gender, Count(PatientID) as 'Number of Patients' From Patient Group by Gender;

-- Count number of hospitalizations per room
Select Room_RoomID as 'Room #', Count(Patient_PatientID) as 'Number of hospitalizations in room' From Hospitalization Group by Room_RoomID;

-- Inner join on Patient and Hospitalization to show all known patient illnesses:
SELECT Patient.Name, Patient.PatientID as 'Patient ID', Hospitalization.Illness as 'Illness', Year(Hospitalization.ReleaseDate) as 'Year of occurence'
FROM Patient
INNER JOIN Hospitalization
ON Hospitalization.Patient_PatientID=Patient.PatientID;