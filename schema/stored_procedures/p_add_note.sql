DROP PROCEDURE IF exists p_add_note;

DELIMITER //
CREATE PROCEDURE p_add_note(IN data JSON)
	BEGIN
    set @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_type'));
	CASE @type
		WHEN "objective" THEN
            call p_add_objective_note(data);
		WHEN "goal" THEN
			call p_add_goal_note(data);
		WHEN "task" THEN
			call p_add_task_note(data);
	END CASE;
	END //

DELIMITER ;
