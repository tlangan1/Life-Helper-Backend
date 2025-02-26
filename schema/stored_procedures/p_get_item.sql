DROP PROCEDURE IF exists p_get_item;

DELIMITER //
CREATE PROCEDURE p_get_item(IN type varchar(30), IN data JSON)
BEGIN
	CASE type
		WHEN "objective" THEN
		    select * from objective
            where objective_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "goal" THEN
		    select * from goal
            where goal_id = JSON_EXTRACT(data, '$.item_id');
		WHEN "task" THEN
		    select * from task
            where task_id = JSON_EXTRACT(data, '$.item_id');
	END CASE;
END //

DELIMITER ;
