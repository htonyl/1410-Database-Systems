USE hospital;

-- Select all patients, then order by date of birth:
SELECT Name, PatientID as 'Patient ID', Birth as 'Date of Birth', Gender FROM Patient
ORDER BY Birth;

-- Inner join on Patient and Hospitalization to show all patients that have been hospitalized:
SELECT Patient.Name, Patient.PatientID as 'Patient ID', Hospitalization.Room_RoomID as 'Room #', Patient.Birth as 'Date of Birth', Patient.Gender 
FROM Patient
INNER JOIN Hospitalization
ON Hospitalization.Patient_PatientID=Patient.PatientID;

-- Group all patients by gender, then order by date of birth
SELECT Name, PatientID as 'Patient ID', Birth as 'Date of Birth', Gender FROM Patient
ORDER BY Birth
GROUP BY Gender
ORDER BY Birth; 
