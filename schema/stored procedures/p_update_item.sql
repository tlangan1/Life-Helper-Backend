DROP PROCEDURE IF exists p_update_item;

DELIMITER //
CREATE PROCEDURE p_update_item(IN type varchar(30), IN data JSON)
BEGIN
	CASE type
		WHEN "start" THEN
			update task set started_dtm = current_timestamp where task_id = JSON_EXTRACT(data, '$.task_id');
		WHEN "complete" THEN
			update task set completed_dtm = current_timestamp where task_id = JSON_EXTRACT(data, '$.task_id');
		WHEN "cancel_delete" THEN
			call p_cancel_delete_item(data);
    END CASE;
END //
DELIMITER ;