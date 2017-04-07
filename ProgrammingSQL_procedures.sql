
-- Create a procedure
CREATE PROCEDURE message
AS 
BEGIN 
   dbms_output.put_line('Good morning and have a great day!'); 
END; 

-- Replace a procedure
REPLACE PROCEDURE message
AS 
BEGIN 
   dbms_output.put_line('Goodby and have a great day!'); 
END; 

-- Delete a procedure
DROP PROCEDURE message; 