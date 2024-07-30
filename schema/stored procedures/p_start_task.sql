DROP PROCEDURE IF exists p_start_task;

DELIMITER //
CREATE PROCEDURE p_start_task(IN data varchar(1000))
BEGIN
	update task set started_dtm = current_timestamp where task_id = Convert(JSON_EXTRACT(data, '$.task_id'), unsigned);
END //
DELIMITER ;