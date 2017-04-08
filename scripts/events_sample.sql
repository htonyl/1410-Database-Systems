CREATE TABLE BackAppointment LIKE Appointment;

DELIMITER //
CREATE PROCEDURE AppointmentBackup ()
BEGIN
DELETE FROM BackAppointment;
INSERT INTO BackAppointment SELECT* FROM Appointment;
END; //
DELIMITER ;