DROP TRIGGER if exists trigger_objective_goal_insert;

DELIMITER //

CREATE TRIGGER trigger_objective_goal_insert
AFTER INSERT
ON objective_goal FOR EACH ROW
	BEGIN
	Insert into trigger_log (statement) select "In the trigger, trigger_objective_goal_insert";
    
    set @objective_id = NEW.objective_id;
    select completed_dtm into @completed_dtm from objective where objective_id = @objective_id;

    IF @completed_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if a goal is added to an objective which is in the completed
        -- state then the completed_dtm column of that objective is set to null
        -- Analogous logic is applied to the relationship between
        -- goals and tasks in the goal_task insert trigger.

		update objective set completed_dtm = null where objective_id = @objective_id;
    END IF;
    END //

DELIMITER ;