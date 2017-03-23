USE Hospital;

-- Adding a new row:
INSERT Patient VALUES ('P008','Steven Eriksen','Male','18/03/1992');

-- Alternatively:
INSERT Patient (PatientID, Name, Gender, Birth)
VALUES ('P008','Steven Eriksen','Male','18/03/1992');

-- Adding multiple rows:
INSERT Patient VALUES
('008','Steven Eriksen','Male','18/03/1992'),
('009','Jenna Svensson','Female','04/07/1984'),
('010','Viktor Christiansen','Male','11/08/1975');

-- Adding with NULL Values:

-- Update multiple values in a row:
UPDATE Patient SET PatientID = ,Name = ‘’, Gender = Male, Birth = ;

-- Update multiple rows:


-- Deleting a row:
INSERT from Patient where PatientID = P008;

-- Deleting multiple rows:
INSERT from Patient where Gender = Male;
