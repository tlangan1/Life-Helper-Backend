DROP PROCEDURE IF exists p_get_items;

DELIMITER //
CREATE PROCEDURE p_get_items(IN type varchar(30), IN data varchar(1000))
BEGIN
	CASE type
		WHEN "objectives" THEN
		    select objective_id as item_id, objective_name as item_name, objective_description as item_description, objective.*
            from objective
            where deleted_dtm Is Null
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, objective_id = JSON_EXTRACT(data, '$.item_id'))
            and if(JSON_EXTRACT(data, '$.include_completed') = false, completed_dtm Is Null, 1 = 1)
            order by objective_name asc;
		WHEN "goals" THEN
			select g.goal_id as item_id, g.goal_name as item_name, g.goal_description as item_description, g.*
			from goal g inner join objective_goal og on g.goal_id = og.goal_id
			where og.objective_id = JSON_EXTRACT(data, '$.parent_id')
			and g.deleted_dtm Is Null
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, g.goal_id = JSON_EXTRACT(data, '$.item_id'))
            and if(JSON_EXTRACT(data, '$.include_completed') = false, completed_dtm Is Null, 1 = 1)
			order by g.goal_name desc;
		WHEN "tasks" THEN
			select t.task_id as item_id, t.task_name as item_name, t.task_description as item_description, t.*
			from task t inner join goal_task gt on t.task_id = gt.task_id
			where gt.goal_id = JSON_EXTRACT(data, '$.parent_id')
			and t.deleted_dtm Is Null
            and if(JSON_EXTRACT(data, '$.item_id') Is Null, 1 = 1, t.task_id = JSON_EXTRACT(data, '$.item_id'))
            and if(JSON_EXTRACT(data, '$.include_completed') = false, completed_dtm Is Null, 1 = 1)
			order by t.task_name desc;
		WHEN "subscriptions" THEN
			select * from web_push_subscription where unsubscribed_or_expired_dtm Is Null;
	END CASE;
END //
DELIMITER ;
