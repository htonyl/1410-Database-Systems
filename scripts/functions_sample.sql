-- Creates function
DROP FUNCTION IF EXISTS RemainCapacity;
DELIMITER //
CREATE FUNCTION RemainCapacity(rID VARCHAR(45))
    RETURNS INT
    BEGIN
    DECLARE max INT;
    DECLARE cur INT;
    SELECT MaxCapacity INTO @max FROM Room
    WHERE RoomID=rID;
    SELECT COUNT(*) INTO @cur FROM Hospitalization
    WHERE Room_RoomID=rID
    AND CURTIME() BETWEEN AdmissionDate AND  ReleaseDate;
    RETURN @max - @cur;
    END; //
DELIMITER ;
