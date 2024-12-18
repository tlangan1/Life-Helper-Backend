DROP PROCEDURE IF exists p_add_item;

DELIMITER //
CREATE PROCEDURE p_add_item(IN type varchar(30), IN data JSON)
BEGIN
	CASE type
		WHEN "objective" THEN
            call p_add_objective(type, data);
		WHEN "goal" THEN
			call p_add_goal(type, data);
		WHEN "task" THEN
			call p_add_task(type, data);
		WHEN "web_push_subscription" THEN
        	insert into web_push_subscription (capability_url, public_key, private_key) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.endpoint')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.keys.p256dh')), JSON_UNQUOTE(JSON_EXTRACT(data, '$.keys.auth')));
	END CASE;
END //
DELIMITER ;