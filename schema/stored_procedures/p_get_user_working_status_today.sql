DROP PROCEDURE IF EXISTS p_get_user_working_status_today;

DELIMITER //
CREATE PROCEDURE p_get_user_working_status_today(
    IN  user_login_id BIGINT,
    OUT user_working BOOLEAN,
    OUT elapsed_work_time FLOAT
)
BEGIN
    DECLARE v_data JSON;

    IF user_login_id IS NULL THEN
        SET user_working = FALSE;
        SET elapsed_work_time = 0;
    ELSE
        SET user_working = f_is_user_working(user_login_id);

        SET v_data = JSON_OBJECT(
            "start_dtm", CURDATE(),
            "end_dtm", DATE_ADD(CURDATE(), INTERVAL 1 DAY),
            "user_login_id", user_login_id
        );

        CALL p_calculate_worked_time(v_data, elapsed_work_time);
    END IF;
END //
DELIMITER ;