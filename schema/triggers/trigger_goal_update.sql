DROP TRIGGER if exists trigger_goal_update;

DELIMITER //

CREATE TRIGGER trigger_goal_update
AFTER UPDATE
ON goal FOR EACH ROW
	BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE id int;
	declare cur_objectives CURSOR for Select o.objective_id from objective o
    inner join objective_goal og on o.objective_id = og.objective_id and og.goal_id = OLD.goal_id;
	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

	Insert into trigger_log (statement) select "In the trigger, trigger_goal_update";
    
    drop temporary table if exists trigger_goal_update_temp;
    
    -- Since task_id never changes once a task is created then OLD.task_id = NEW.task_id
    set @goal_id = OLD.goal_id;

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- A goal has been started. If there are any objectives for which 
        -- this is the first of their goals to be started then
        -- the objective should be marked as started.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_goal_update_temp select o.objective_id from objective_goal og
        inner join objective o on og.objective_id = o.objective_id
		where og.goal_id = @goal_id
        and o.started_dtm Is Null;

		update objective set started_dtm = now() where objective_id in (select objective_id from trigger_goal_update_temp);
        
		drop temporary table if exists trigger_goal_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- A goal has been completed. If there are no other open goals
        -- associated with any of the objective it applies to
        -- then each of those objective should be completed.
        
		Insert into trigger_log (statement) select "In the completed IF";

		-- open the cursor
		OPEN cur_objectives;
		
		FETCH cur_objectives into id;
		WHILE Not done DO
			select count(*) into @open_goal_count from objective_goal og inner join goal g on og.goal_id = g.goal_id
			where og.objective_id = id
            and   g.completed_dtm Is Null
			and   g.deleted_dtm Is Null;
			
			IF @open_goal_count = 0 THEN
				update objective set completed_dtm = now() where objective_id = id;
			END IF;
			
			FETCH cur_objectives into id;
		END WHILE;

		-- close the cursor
		CLOSE cur_objectives;
	END IF;

	drop temporary table if exists trigger_goal_update_temp;
    END //

DELIMITER ;