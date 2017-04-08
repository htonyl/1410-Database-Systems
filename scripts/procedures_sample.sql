DROP PROCEDURE IF EXISTS FindVacantRoom;
DELIMITER //
CREATE PROCEDURE FindVacantRoom(IN patID VARCHAR(45), IN doctID VARCHAR(45), IN illness VARCHAR(45))
  BEGIN
  DECLARE room VARCHAR(45);
  DECLARE dept VARCHAR(45);
  DECLARE N_hospt INT;
  SELECT Department_DeptID INTO dept FROM Doctor
  WHERE DoctorID=doctID LIMIT 1;
  SELECT RoomID INTO room FROM Room
  WHERE Department_DeptID=dept
  AND RemainCapacity(RoomID) > 0 LIMIT 1;
  SELECT COUNT(*) INTO N_hospt FROM Hospitalization;
  INSERT INTO Hospitalization
    (HosptID, AdmissionDate, Illness,
      Doctor_DoctorID, Doctor_Name, Room_RoomID, Patient_PatientID, Patient_Name) VALUES
    (CONCAT('H', LPAD(N_hospt + 1, 3, '0')), CURTIME(), illness,
    doctID, (SELECT Name FROM Doctor WHERE DoctorID=doctID),
    room, patID, (SELECT Name FROM Patient WHERE PatientID=patID));
END; //
DELIMITER ;
