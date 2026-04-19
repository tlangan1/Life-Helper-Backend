DROP TRIGGER if exists trigger_goal_task_insert;

DELIMITER //

CREATE TRIGGER trigger_goal_task_insert
AFTER INSERT
ON goal_task FOR EACH ROW
	BEGIN
	Insert into trigger_log (statement) select "In the trigger, trigger_goal_task_insert";
    
    set @goal_id = NEW.goal_id;
    select completed_dtm, canceled_dtm into @completed_dtm, @canceled_dtm from goal where goal_id = @goal_id;

    IF @completed_dtm is not null OR @canceled_dtm is not null THEN
		-- This logic enforces the integrity of the data. It ensures
        -- that if a task is added to a goal which is in the completed
        -- state or the canceled state, then the appropriate column
        -- , completed_dtm or canceled_dtm, of that goal is set to null
        -- Analogous logic is applied to the relationship between
        -- objectives and goals in the objective_goal insert trigger.
        IF @completed_dtm is not null THEN
            update goal set completed_dtm = null where goal_id = @goal_id;
        ELSE
            update goal set canceled_dtm = null where goal_id = @goal_id;
        END IF;
    END IF;
    END //

DELIMITER ;