DROP TRIGGER if exists trigger_goal_update;

DELIMITER //

CREATE TRIGGER trigger_goal_update
AFTER UPDATE
ON goal FOR EACH ROW
	BEGIN
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

	drop temporary table if exists trigger_goal_update_temp;
    END //

DELIMITER ;