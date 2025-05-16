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
    
    -- Since goal_id never changes once a goal is created then OLD.goal_id = NEW.goal_id
    set @goal_id = OLD.goal_id;

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if an objective relies on one or more goals and at least one
        -- of them has been started then the objective should be in the 
        -- started state. The logic is enforced as follows:
		-- A goal has been started. If there are any objectives for which 
        -- this is the first of their goals to be started then
        -- the objective should be marked as started.
        -- Analogous logic is applied to the relationship between
        -- goals and tasks in the task update trigger.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_goal_update_temp select o.objective_id from objective_goal og
        inner join objective o on og.objective_id = o.objective_id
		where og.goal_id = @goal_id
        and o.started_dtm Is Null;

		update objective set started_dtm = now() where objective_id in (select objective_id from trigger_goal_update_temp);
        
		drop temporary table if exists trigger_goal_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if an objective relies on one or more goals and all of them
        -- have been completed then the objective should be in the completed
        -- state. The logic is enforced as follows:
		-- A goal has been completed. If there are no other open goals
        -- associated with any of the objectives it applies to then each of
        -- those objectives should be completed.
        -- Analogous logic is applied to the relationship between
        -- goals and tasks in the task update trigger.
        
		Insert into trigger_log (statement) select "In the completed IF";

		-- open the cursor
		OPEN cur_objectives;
		
		FETCH cur_objectives into id;
		WHILE Not done DO
			select count(*) into @open_goal_count from objective_goal og inner join goal g on og.goal_id = g.goal_id
			where og.objective_id = id
            and   g.completed_dtm Is Null
			and   g.canceled_dtm Is Null;
			
			IF @open_goal_count = 0 THEN
				update objective set completed_dtm = now() where objective_id = id;
			END IF;
			
			FETCH cur_objectives into id;
		END WHILE;

		-- close the cursor
		CLOSE cur_objectives;
	END IF;
    IF OLD.completed_dtm is not null AND NEW.completed_dtm is null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if an objective relies on a goal whose state has changed from
        -- completed to not completed then the objective should be in the
        -- not completed state. The logic is enforced as follows:
        -- A goal has been uncompleted. If there are any objectives which
        -- depend on this goal and which are in the completed state then
        -- those objectives should be uncompleted.       
		-- open the cursor

		OPEN cur_objectives;
		
		FETCH cur_objectives into id;
		WHILE Not done DO
            update objective set completed_dtm = null where objective_id = id;
			
			FETCH cur_objectives into id;
		END WHILE;

		-- close the cursor
		CLOSE cur_objectives;
    END IF;

	drop temporary table if exists trigger_goal_update_temp;
    END //

DELIMITER ;