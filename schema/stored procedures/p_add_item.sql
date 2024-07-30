DROP PROCEDURE IF exists p_add_item;

DELIMITER //
CREATE PROCEDURE p_add_item(IN type varchar(30), IN data varchar(1000))
BEGIN
	CASE type
		WHEN "objective" THEN
			insert into objective (objective_name, objective_description) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')));
		WHEN "goal" THEN
			insert into goal (goal_name, goal_description, objective_id) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')), Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned));
		WHEN "task" THEN
			insert into task (task_name, task_description, goal_id) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.name')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.description')), Convert(JSON_EXTRACT(data, '$.parent_id'), unsigned));
		WHEN "web_push_subscription" THEN
        	insert into web_push_subscription (capability_url, public_key, private_key) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.endpoint')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.keys.p256dh')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.keys.auth')));
	END CASE;
END //
DELIMITER ;