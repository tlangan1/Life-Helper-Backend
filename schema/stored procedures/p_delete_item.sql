DROP PROCEDURE IF exists p_delete_item;

DELIMITER //
CREATE PROCEDURE p_delete_item(IN type varchar(30), IN data varchar(1000))
BEGIN
	CASE type
		WHEN "objective" THEN
			update objective set deleted_dtm = current_timestamp() where objective_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "goal" THEN
			update goal set deleted_dtm = current_timestamp() where goal_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "task" THEN
			update task set deleted_dtm = current_timestamp() where task_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "web_push_subscription" THEN
            update web_push_subscription set expired_dtm  = current_timestamp() where capability_url = JSON_EXTRACT(data, '$.capability_url');
	END CASE;
END //
DELIMITER ;