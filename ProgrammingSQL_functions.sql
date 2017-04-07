-- Creates function
CREATE FUNCTION totalPatients
RETURN number IS 
   total number(2) := 0;
BEGIN 
   SELECT count(*) into total 
   FROM patients; 
    
   RETURN total; 
END; 

-- Calling a Function
DECLARE 
   c number(2); 
BEGIN 
   c := totalPatients(); 
   dbms_output.put_line('Total number of patients: ' || c); 
END; 
