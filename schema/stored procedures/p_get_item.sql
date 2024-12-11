-- p_get_item expects:
-- type: an element of {"objective", "goal", "task"}
-- data: an JSON object of the form {"id": xxx}


DROP PROCEDURE IF exists p_get_item;

DELIMITER //
CREATE PROCEDURE p_get_item(IN type varchar(30), IN data varchar(1000))
BEGIN
	CASE type
		WHEN "objectives" THEN
		    select objective_id as item_id, objective_name as item_name, objective_description as item_description, objective.* from objective where objective_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "goals" THEN
			select goal_id as item_id, goal_name as item_name, goal_description as item_description, goal.* from goal where goal_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
		WHEN "tasks" THEN
			select task_id as item_id, task_name as item_name, task_description as item_description, task.* from task where task_id = Convert(JSON_EXTRACT(data, '$.item_id'), unsigned);
	END CASE;
END //
DELIMITER ;
