
-- One potential flaw of this logic might be exposed if there is
-- already an objective or goal with any of the
-- names in the objectives and goals created below.

drop procedure if exists p_task_and_goal_trigger_test_2;

DELIMITER //
create procedure p_task_and_goal_trigger_test_2()
	BEGIN
	-- Create Objective 1
	set @objective_description = "Some Description";
	set @objective_1_name = "Test Objective 1";
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_1_name, 'item_description', @objective_description);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_1_id from objective where item_name = @objective_1_name;

	-- Create Objective 2
	set @objective_2_name = "Test Objective 2";
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_2_name, 'item_description', @objective_description);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_2_id from objective where item_name = @objective_2_name;

	-- Create Objective 3
	set @objective_3_name = "Test Objective 3";
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_3_name, 'item_description', @objective_description);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_3_id from objective where item_name = @objective_3_name;

	-- Create Goal 1
	set @goal_description = "Some Goal Description";
	set @goal_1_name = "Test Goal 1";
	set @JSON = JSON_OBJECT('parent_id', @objective_2_id, 'item_name', @goal_1_name, 'item_description', @goal_description);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_1_id from goal where item_name = @goal_1_name;

	-- Create Goal 2
	set @goal_2_name = "Test Goal 2";
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'item_name', @goal_2_name, 'item_description', @goal_description);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_2_id from goal where item_name = @goal_2_name;

	-- Create Goal 3
	set @goal_3_name = "Test Goal 3";
	set @JSON = JSON_OBJECT('parent_id', @objective_2_id, 'item_name', @goal_3_name, 'item_description', @goal_description);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_3_id from goal where item_name = @goal_3_name;

	-- Attach Goal 1 to Objective 3
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'child_id', @goal_1_id);
	PREPARE statement FROM 'call p_attach_item("goal", ?)';
	Execute statement using @JSON;

	-- Create Task 1
	set @task_description = "Task Desc.";
	set @task_1_name = "Test Task 1";
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_1_name, 'item_description', @task_description);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_1_id from task where item_name = @task_1_name;

	-- Create Task 2
	set @task_2_name = "Test Task 2";
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_2_name, 'item_description', @task_description);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_2_id from task where item_name = @task_2_name;

	-- Create Task 3
	set @task_3_name = "Test Task 3";
	set @JSON = JSON_OBJECT('parent_id', @goal_3_id, 'item_name', @task_3_name, 'item_description', @task_description);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_3_id from task where item_name = @task_3_name;

	-- Attach Task 2 to Goal 2
	set @JSON = JSON_OBJECT('parent_id', @goal_2_id, 'child_id', @task_2_id);
	PREPARE statement FROM 'call p_attach_item("task", ?)';
	Execute statement using @JSON;

	-- Start Task 2
	set @JSON = JSON_OBJECT('task_id', @task_2_id);
	PREPARE statement FROM 'call p_update_item("start", ?)';
	Execute statement using @JSON;

	-- Complete Task 2
	set @JSON = JSON_OBJECT('task_id', @task_2_id);
	PREPARE statement FROM 'call p_update_item("complete", ?)';
	Execute statement using @JSON;

	-- Make sure the initial condition of everything is un-completed except for goal 2 is true
	Select count(*) into @count from objective where objective_id in (@objective_1_id, @objective_2_id, @objective_3_id)
    and completed_dtm Is Null;
	Select completed_dtm into @goal_1_completed from goal where goal_id = @goal_1_id;
	Select completed_dtm into @goal_2_completed from goal where goal_id = @goal_2_id;
	Select completed_dtm into @goal_3_completed from goal where goal_id = @goal_3_id;
	Select completed_dtm into @task_1_completed from task where task_id = @task_1_id;
	Select completed_dtm into @task_2_completed from task where task_id = @task_2_id;
	Select completed_dtm into @task_3_completed from task where task_id = @task_3_id;
	IF @count = 3 THEN
        IF @goal_1_completed Is Null and @goal_2_completed Is Not Null and @goal_3_completed Is Null THEN
			IF @task_1_completed Is Null and @task_2_completed Is Not Null and @task_3_completed Is Null THEN
				select "SUCCESS: Initial Assertion Correct" as result;
			ELSE
				select "FAILURE: Initial Assertion Incorrect" as result;
			END IF;
		ELSE
			select "FAILURE: Initial Assertion Incorrect" as result;
        END IF;
	ELSE
		select "FAILURE: Initial Assertion Incorrect" as result;
    END IF;

	-- Start Task 1
	set @JSON = JSON_OBJECT('task_id', @task_1_id);
	PREPARE statement FROM 'call p_update_item("start", ?)';
	Execute statement using @JSON;

	-- Complete Task 1
	set @JSON = JSON_OBJECT('task_id', @task_1_id);
	PREPARE statement FROM 'call p_update_item("complete", ?)';
	Execute statement using @JSON;

	-- Make sure the final condition of the right items being started is true
	Select completed_dtm into @objective_1_completed from objective where objective_id = @objective_1_id;
	Select completed_dtm into @objective_2_completed from objective where objective_id = @objective_2_id;
	Select completed_dtm into @objective_3_completed from objective where objective_id = @objective_3_id;
	Select completed_dtm into @goal_1_completed from goal where goal_id = @goal_1_id;
	Select completed_dtm into @goal_2_completed from goal where goal_id = @goal_2_id;
	Select completed_dtm into @goal_3_completed from goal where goal_id = @goal_3_id;
	Select completed_dtm into @task_1_completed from task where task_id = @task_1_id;
	Select completed_dtm into @task_2_completed from task where task_id = @task_2_id;
	Select completed_dtm into @task_3_completed from task where task_id = @task_3_id;
	IF @objective_1_completed Is Null and @objective_2_completed Is Null and @objective_3_completed Is Not Null THEN
		IF @goal_1_completed Is Not Null and @goal_2_completed Is Not Null and @goal_3_completed Is Null THEN
			IF @task_1_completed Is Not Null and @task_2_completed Is Not Null and @task_3_completed Is Null THEN
				select "SUCCESS: Final Assertion Correct" as result;
			ELSE
				select "FAILURE: Final Assertion Incorrect" as result;
			END IF;
		ELSE
			select "FAILURE: Final Assertion Incorrect" as result;
        END IF;
	ELSE
		select "FAILURE: Final Assertion Incorrect" as result;
    END IF;

	DEALLOCATE PREPARE statement;
END //



DELIMITER ;