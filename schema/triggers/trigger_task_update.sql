DROP TRIGGER if exists trigger_task_update;

DELIMITER //

-- DO NOT USE CASCADING TRIGGERS!
-- This approach of dealing with the consequences of closing a task
-- is safer than doing so in cascading triggers. That is, do not
-- put an update trigger on the goal table as it will not fire
-- when the goal is updated in this trigger. I have concluded that
-- "that is just the way it is".

CREATE TRIGGER trigger_task_update
AFTER UPDATE
ON task FOR EACH ROW
	BEGIN
	Insert into trigger_log (statement) select "In the trigger, trigger_task_update";
    
    drop temporary table if exists temp;

    IF OLD.started_dtm is null AND NEW.started_dtm is not null THEN
		-- A task has been started. If there are any goals for which 
        -- this is the first of their tasks to be started then
        -- the goal should be marked as started.
        -- Apply the same logic to the relationship between goals and objectives.

		Insert into trigger_log (statement) select "In the started IF";
        
		Create temporary table temp select g.goal_id from goal_task gt
        inner join goal g on gt.goal_id = g.goal_id
		inner join task t on gt.task_id = t.task_id
		where g.started_dtm Is Null
		and t.started_dtm Is Not Null
		and t.completed_dtm Is Null;

		update goal set started_dtm = now() where goal_id in (select goal_id from temp);
        
		drop temporary table if exists temp;
        
		Create temporary table temp select o.objective_id from objective_goal og
        inner join objective o on og.objective_id = o.objective_id
		inner join goal g on og.goal_id = g.goal_id
		where o.started_dtm Is Null
		and g.started_dtm Is Not Null
		and g.completed_dtm Is Null;

		update objective set started_dtm = now() where objective_id in (select objective_id from temp);
    END IF;
    IF OLD.completed_dtm is null AND NEW.completed_dtm is not null THEN
		-- A task has been completed. If there are no other open tasks
        -- associated with any of the goals it applies to
        -- then each of those goals should be completed.
        -- Apply the same logic to the relationship between goals and objectives.
        
		Insert into trigger_log (statement) select "In the completed IF";

        Create temporary table temp 
		select goal_id from goal g where not exists
			(select * from goal_task gt inner join task t on gt.task_id = t.task_id
			where g.goal_id = gt.goal_id
			and t.deleted_dtm Is Null
			and t.completed_dtm Is Null);
		
		update goal set completed_dtm = now() where goal_id in (select goal_id from temp);

		drop temporary table if exists temp;
        
        Create temporary table temp 
		select objective_id from objective o where not exists
			(select * from objective_goal og inner join goal g on og.goal_id = g.goal_id
			where o.objective_id = og.objective_id
			and g.deleted_dtm Is Null
			and g.completed_dtm Is Null)
            and exists (select * from objective_goal og where o.objective_id = og.objective_id);

		update objective set completed_dtm = now() where objective_id in (select objective_id from temp);
	END IF;

	drop temporary table if exists temp;
    END //

DELIMITER ;