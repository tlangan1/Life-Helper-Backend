DROP PROCEDURE IF exists p_update_goal;

DELIMITER //
CREATE PROCEDURE p_update_goal(IN data JSON)
BEGIN
	Set @update_type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.update_type'));

	CASE @update_type
		WHEN "cancel_delete" THEN
			update goal set deleted_dtm = current_timestamp() where goal_id = JSON_EXTRACT(data, '$.item_id');
	END CASE;
END //
