CREATE TABLE PatientLog LIKE Patient;
ALTER TABLE PatientLog ADD LogTime TIMESTAMP(0);

DELIMITER //
CREATE TRIGGER Patient_After_Insert
AFTER INSERT ON Patient FOR EACH ROW
BEGIN
INSERT PatientLog VALUES (New.PatientID, New.Name, New.Gender, New.Birth, NOW(0));
END; //
DELIMITER ;
