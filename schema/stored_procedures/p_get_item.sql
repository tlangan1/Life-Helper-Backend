DROP PROCEDURE IF exists p_get_item;

-- This stored procedure is used to obtain a task
-- without appealing to its relationship to a parent goal.
-- That is what distinguishes it from p_get_items.
-- As of 2/28/2025 this capability is only used to propogate
-- information about tasks changing state in the web push process.
-- 
-- This procedure also supports a request for individual objectives
-- and goals but as of 2/28/2025 that capability is not used.

-- This procedure was retired on 5/5/2025 in favor of p_get_items.

-- DELIMITER //
-- CREATE PROCEDURE p_get_item(IN type varchar(30), IN data JSON)
-- BEGIN
-- 	CASE type
-- 		WHEN "objective" THEN
-- 		    select * from objective
--             where objective_id = JSON_EXTRACT(data, '$.item_id');
-- 		WHEN "goal" THEN
-- 		    select * from goal
--             where goal_id = JSON_EXTRACT(data, '$.item_id');
-- 		WHEN "task" THEN
-- 		    -- select * from task
--             -- where task_id = JSON_EXTRACT(data, '$.item_id');
--    		    select t.*, t.task_id as item_id, tu.user_login_id from task t inner join task_user tu on t.task_id = tu.task_id
--             where t.task_id = JSON_EXTRACT(data, '$.item_id');
-- 	END CASE;
-- END //

-- DELIMITER ;
