-- Commit Command
DELETE FROM patients
WHERE AGE = 20;
COMMIT;

-- Rollback Command
DELETE FROM patients
WHERE AGE = 20;
ROLLBACK;

-- Savepoint command
SAVEPOINT SP1;
DELETE FROM Patients WHERE PatientID = P001;
SAVEPOINT SP2;
DELETE FROM Patients WHERE PatientID = P002;



