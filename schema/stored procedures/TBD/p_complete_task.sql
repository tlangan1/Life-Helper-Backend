DROP PROCEDURE IF exists p_complete_task;

DELIMITER //
CREATE PROCEDURE p_complete_task(IN data varchar(1000))
BEGIN
	update task set completed_dtm = current_timestamp where task_id = JSON_EXTRACT(data, '$.task_id');
END //
DELIMITER ;