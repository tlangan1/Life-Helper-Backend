DROP TRIGGER if exists trigger_task_update;

DELIMITER //

CREATE TRIGGER trigger_task_update
AFTER UPDATE
ON task FOR EACH ROW
	BEGIN
	Insert into trigger_log (statement) select "In the trigger, trigger_task_update";
    
    drop temporary table if exists trigger_task_update_temp;
    
    -- Since task_id never changes once a task is created then OLD.task_id = NEW.task_id
    set @task_id = OLD.task_id;

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- A task has been started. If there are any goals for which 
        -- this is the first of their tasks to be started then
        -- the goal should be marked as started.
        -- Apply the same logic to the relationship between goals and objectives
        -- in the trigger trigger_goal_update.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table trigger_task_update_temp select g.goal_id from goal_task gt
        inner join goal g on gt.goal_id = g.goal_id
		where gt.task_id = @task_id
        and g.started_dtm Is Null;

		update goal set started_dtm = now() where goal_id in (select goal_id from trigger_task_update_temp);
        
		drop temporary table if exists trigger_task_update_temp;
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- A task has been completed. If there are no other open tasks
        -- associated with any of the goals it applies to
        -- then each of those goals should be completed.
        -- Apply the same logic to the relationship between goals and objectives.
        
		Insert into trigger_log (statement) select "In the completed IF";

        Create temporary table trigger_task_update_temp 
		select goal_id from goal g where not exists
			(select * from goal_task gt inner join task t on gt.task_id = t.task_id
			where g.goal_id = gt.goal_id
			and t.deleted_dtm Is Null
			and t.completed_dtm Is Null);
		
		update goal set completed_dtm = now() where goal_id in (select goal_id from trigger_task_update_temp);

		drop temporary table if exists trigger_task_update_temp;
        
        Create temporary table trigger_task_update_temp 
		select objective_id from objective o where not exists
			(select * from objective_goal og inner join goal g on og.goal_id = g.goal_id
			where o.objective_id = og.objective_id
			and g.deleted_dtm Is Null
			and g.completed_dtm Is Null)
            and exists (select * from objective_goal og where o.objective_id = og.objective_id);

		update objective set completed_dtm = now() where objective_id in (select objective_id from trigger_task_update_temp);
	END IF;

	drop temporary table if exists trigger_task_update_temp;
    END //

DELIMITER ;