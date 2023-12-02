DROP PROCEDURE IF exists p_add_item;

DELIMITER //
CREATE PROCEDURE p_add_item(IN data varchar(1000), IN type varchar(20))
BEGIN
	CASE type
		WHEN "objective" THEN
			insert into objective (objective_name, objective_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')));
		WHEN "goal" THEN
			insert into goal (goal_name, goal_description, objective_id) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')), Convert(JSON_EXTRACT(data, '$.item_id'), unsigned));
		WHEN "task" THEN
			insert into task (task_name, task_description, goal_id) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')), Convert(JSON_EXTRACT(data, '$.item_id'), unsigned));
	END CASE;
END //
DELIMITER ;