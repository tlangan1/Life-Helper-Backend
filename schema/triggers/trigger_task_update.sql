DROP TRIGGER if exists trigger_task_update;

DELIMITER //

CREATE TRIGGER trigger_task_update
AFTER UPDATE
ON task FOR EACH ROW
	BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE id int;
	DECLARE cur_goals CURSOR for Select g.goal_id from goal g
    inner join goal_task gt on g.goal_id = gt.goal_id and task_id = OLD.task_id;
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

	Insert into trigger_log (statement) select "In the trigger, trigger_task_update";
    
    drop temporary table if exists trigger_task_update_temp;
    
    -- Since task_id never changes once a task is created then OLD.task_id = NEW.task_id

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- A task has been started. If there are any goals for which 
        -- this is the first of their tasks to be started then
        -- the goal should be marked as started.
        -- Apply the same logic to the relationship between goals and objectives
        -- in the trigger trigger_goal_update.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_task_update_temp select g.goal_id from goal_task gt
        inner join goal g on gt.goal_id = g.goal_id
		where gt.task_id = OLD.task_id
        and g.started_dtm Is Null;
        
		update goal set started_dtm = now() where goal_id in (select goal_id from trigger_task_update_temp);
        
		drop temporary table if exists trigger_task_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- A task has been completed. If there are no other open tasks
        -- associated with any of the goals it applies to
        -- then each of those goals should be completed.
        -- Apply the same logic to the relationship between goals and objectives
        -- in the trigger trigger_goal_update.
        
		Insert into trigger_log (statement) select "In the completed IF";

		-- open the cursor
		OPEN cur_goals;
		
		FETCH cur_goals into id;
		WHILE Not done DO
			select count(*) into @open_task_count from goal_task gt inner join task t on gt.task_id = t.task_id
			where gt.goal_id = id
            and   t.completed_dtm Is Null
			and   t.deleted_dtm Is Null;
			
			IF @open_task_count = 0 THEN
				update goal set completed_dtm = now() where goal_id = id;
			END IF;
			
			FETCH cur_goals into id;
		END WHILE;

		-- close the cursor
		CLOSE cur_goals;
	END IF;

	drop temporary table if exists trigger_task_update_temp;
    END //

DELIMITER ;