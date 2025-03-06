DROP PROCEDURE IF exists p_get_item;

-- This stored procedure is used to obtain a task
-- without appealing to its relationship to a parent goal.
-- That is what distinguishes it from p_get_items.
-- As of 2/28/2025 this capability is only used to propogate
-- information about tasks changing state in the web push process.
-- 
-- This procedure also supports a request for individual objectives
-- and goals but as of 2/28/2025 that capability is not used.

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
