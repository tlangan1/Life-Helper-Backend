DROP PROCEDURE IF exists p_get_items;

DELIMITER //
CREATE PROCEDURE p_get_items(IN type varchar(30), IN data varchar(1000))
BEGIN
	CASE type
		WHEN "objectives" THEN
		    select objective_id as item_id, objective_name as item_name, objective.* from objective where deleted_dtm Is Null order by objective_name asc;
		WHEN "goals" THEN
			select g.goal_id as item_id, g.goal_name as item_name, g.*
			from goal g inner join objective_goal og on g.goal_id = og.goal_id
			where og.objective_id = Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned)
			and g.deleted_dtm Is Null
			order by g.goal_name desc;
		WHEN "tasks" THEN
			select t.task_id as item_id, t.task_name as item_name, t.*
			from task t inner join goal_task gt on t.task_id = gt.task_id
			where gt.goal_id = Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned)
			and t.deleted_dtm Is Null
			order by t.task_name desc;
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
	END CASE;
END //
DELIMITER ;
