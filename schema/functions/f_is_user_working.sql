DROP FUNCTION IF EXISTS f_is_user_working;

DELIMITER //

CREATE FUNCTION f_is_user_working(user_login_id INT) 
RETURNS BOOLEAN
READS SQL DATA
BEGIN
  RETURN (
    SELECT CASE 
      WHEN EXISTS (
        SELECT 1 FROM work_log wl 
        WHERE wl.user_login_id = user_login_id
        AND wl.stopped_work_dtm IS NULL
      ) THEN true
      ELSE false
    END
  );
END //

DELIMITER ;