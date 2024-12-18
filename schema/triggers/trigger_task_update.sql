DROP TRIGGER if exists trigger_task_update;

DELIMITER //

CREATE TRIGGER trigger_task_update
AFTER UPDATE
ON task FOR EACH ROW
	BEGIN
	Insert into trigger_log (statement) select "In the trigger, trigger_task_update";
	Insert into trigger_log (statement) select if (old.completed_dtm is null, 'null', old.completed_dtm);
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		SELECT goal_id INTO @goal_id from goal_task gt where NEW.task_id = gt.task_id;
        
		Insert into trigger_log (statement) select "In the IF";
        
        SELECT count(*) INTO @open_task_count from goal_task gt inner join task t on gt.task_id = t.task_id
        WHERE gt.goal_id = @goal_id
        AND t.completed_dtm Is Null;
        
        Insert into trigger_log (statement) select CONCAT("@open_task_count for tasks is: ", @open_task_count);
        
        IF @open_task_count = 0 THEN
			-- DO NOT USE CASCADING TRIGGERS!
            -- This approach of dealing with the consequences of closing a task
            -- is safer than doing so in cascading triggers. That is, do not
            -- put an update trigger on the goal table as it will not fire
            -- when the goal is updated in this trigger. I have concluded that
            -- "that is just the way it is".
            
			update goal set completed_dtm = now() where goal_id = @goal_id;
			
            SELECT objective_id INTO @objective_id from objective_goal og where @goal_id = og.goal_id;
        
			SELECT count(*) INTO @open_goal_count from objective_goal og inner join goal g on og.goal_id = g.goal_id
			WHERE og.objective_id = @objective_id
			AND g.completed_dtm Is Null;

			Insert into trigger_log (statement) select CONCAT("@open_goal_count for goals is: ", @open_goal_count);

			-- Is there a scenario in which @open_goal_count would be 0...I don't see how
            -- but it would not hurt to test for "1 or 0" i guess???
			IF @open_goal_count = 1 THEN
				-- It must be the last one that was just closed
                -- Remember that the goal will not appear closed within the scope of this trigger
                -- even though it was closed in this trigger.
				update objective set completed_dtm = now() where objective_id = @objective_id;
			END IF;
        END IF;
    END IF;
    END //

DELIMITER ;