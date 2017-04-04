USE Hospital;
SET SQL_SAFE_UPDATES=0;

-- Adding a new row:
INSERT Patient VALUES ('P007','Steven Eriksen','Male',STR_TO_DATE('18/03/1992', '%d/%m/%Y'));

-- Alternatively:
INSERT Patient (PatientID, Name, Gender, Birth)
VALUES ('P007','Steven Eriksen','Male',STR_TO_DATE('18/03/1992', '%d/%m/%Y'));

-- Adding multiple rows:
INSERT Patient VALUES
('P008','John Liu','Male',STR_TO_DATE('11/03/1990', '%d/%m/%Y')),
('P009','Jenna Svensson','Female',STR_TO_DATE('04/07/1984', '%d/%m/%Y')),
('P010','Viktor Christiansen','Male',STR_TO_DATE('11/08/1975', '%d/%m/%Y'));

-- Adding with NULL Values:

-- Update multiple values in a row:
UPDATE Patient SET Birth = STR_TO_DATE('04/07/1977', '%d/%m/%Y')) WHERE PatientID = 'P009';

-- Update multiple rows:
UPDATE Patient SET Gender = CASE WHEN Gender = 'Male' THEN 'M' ELSE 'F' END;

-- Deleting a row:
DELETE FROM Patient WHERE PatientID='P008';

-- Deleting multiple rows:
DELETE FROM Patient WHERE Gender='Male';

SET SQL_SAFE_UPDATES=1;
