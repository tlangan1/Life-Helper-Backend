DROP PROCEDURE IF exists p_delete_item;

DELIMITER //
CREATE PROCEDURE p_delete_item(IN data varchar(1000), IN type varchar(20))
BEGIN
	CASE type
		WHEN "objective" THEN
			update objective set deleted_dtm = current_timestamp() where objective_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "goal" THEN
			update goal set deleted_dtm = current_timestamp() where goal_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "task" THEN
			update task set deleted_dtm = current_timestamp() where task_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
	END CASE;
END //
DELIMITER ;