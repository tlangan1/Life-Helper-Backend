DROP PROCEDURE IF exists p_get_items;

DELIMITER //
CREATE PROCEDURE p_get_items(IN type varchar(30), IN data varchar(1000))
BEGIN
	CASE type
		WHEN "objectives" THEN
		    select objective_id as item_id, objective_name as item_name, objective.* from objective where deleted_dtm Is Null;
		WHEN "goals" THEN
			select goal_id as item_id, goal_name as item_name, goal.* from goal where objective_id = Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned) and deleted_dtm Is Null;
		WHEN "tasks" THEN
			select task_id as item_id, task_name as item_name, task.* from task where goal_id = Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned) and deleted_dtm Is Null;
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
	END CASE;
END //
DELIMITER ;
