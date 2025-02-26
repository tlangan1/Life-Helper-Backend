DROP PROCEDURE IF exists p_cancel_delete_item;

DELIMITER //
CREATE PROCEDURE p_cancel_delete_item(IN data JSON)
BEGIN
	set @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_type'));
    select @type;
	CASE @type
		WHEN "objective" THEN
			update objective set deleted_dtm = current_timestamp() where objective_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "goal" THEN
			update goal set deleted_dtm = current_timestamp() where goal_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "task" THEN
			update task set deleted_dtm = current_timestamp() where task_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "web_push_subscription" THEN
            update web_push_subscription set unsubscribed_or_expired_dtm = current_timestamp() where capability_url = JSON_EXTRACT(data, '$.capability_url');
	END CASE;
END //
DELIMITER ;