-- One potential flaw of this logic might be exposed if there is
-- already an objective or goal with any of the
-- names in the objectives and goals created below.

drop procedure if exists p_task_and_goal_trigger_test_3;

-- This test is designed to ensure the following data integrity rules.
-- If a task is added to a goal which is in the completed state
-- then the completed_dtm column of that that single goal is set to null.
-- Further, if a goal changes from completed to not completed then the
-- completed_dtm column of all objectives associated with that goal are
-- set to null.
-- Finally, if a goal is added to an objective which is in the
-- completed state then the completed_dtm column of that single objective
-- is set to null.

DELIMITER //
create procedure p_task_and_goal_trigger_test_3()
	BEGIN
	-- Create Objective 1
    set @test_name = "task and goal trigger test 3";
    select @test_name as running_test;
    -- DO NOT change this variable name to @user_login_id. Things will break.
    set @login_id = 2;

    insert into test_results (test_results_line) values (CONCAT("Beginning: ", @test_name));
	set @objective_description = "Some Description";
	set @objective_1_name = CONCAT("Objective 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_1_name, 'item_description', @objective_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_1_id from objective where item_name = @objective_1_name;

	-- Create Objective 2
	set @objective_2_name = CONCAT("Objective 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_2_name, 'item_description', @objective_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_2_id from objective where item_name = @objective_2_name;

	-- Create Objective 3
	set @objective_3_name = CONCAT("Objective 3 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_3_name, 'item_description', @objective_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_3_id from objective where item_name = @objective_3_name;

	-- Create Goal 1
	set @goal_description = "Some Goal Description";
	set @goal_1_name = CONCAT("Goal 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_1_id, 'item_name', @goal_1_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_1_id from goal where item_name = @goal_1_name;

	-- Create Goal 2
	set @goal_2_name = CONCAT("Goal 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_2_id, 'item_name', @goal_2_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_2_id from goal where item_name = @goal_2_name;

	-- Create Goal 3
	set @goal_3_name = CONCAT("Goal 3 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'item_name', @goal_3_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_3_id from goal where item_name = @goal_3_name;

	-- Attach Goal 2 to Objective 1
	set @JSON = JSON_OBJECT('parent_id', @objective_1_id, 'child_id', @goal_2_id);
	PREPARE statement FROM 'call p_attach_item("goal", ?)';
	Execute statement using @JSON;

	-- Create Task 1
	set @task_description = "Task Desc.";
	set @task_1_name = CONCAT("Task 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_1_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_1_id from task where item_name = @task_1_name;

	-- Create Task 2
	set @task_2_name = CONCAT("Task 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_2_id, 'item_name', @task_2_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_2_id from task where item_name = @task_2_name;

	-- Create Task 3
	set @task_3_name = CONCAT("Task 3 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_3_id, 'item_name', @task_3_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_3_id from task where item_name = @task_3_name;

	-- Start Task 1
	set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_1_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Complete Task 1
	set @JSON = JSON_OBJECT('update_type', 'complete', 'item_id', @task_1_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Start Task 2
	set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_2_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Complete Task 2
	set @JSON = JSON_OBJECT('update_type', 'complete', 'item_id', @task_2_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Start Task 3
	set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_3_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Complete Task 3
	set @JSON = JSON_OBJECT('update_type', 'complete', 'item_id', @task_3_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
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
	IF @count = 0 THEN
        IF @goal_1_completed Is Not Null and @goal_2_completed Is Not Null and @goal_3_completed Is Not Null THEN
			IF @task_1_completed Is Not Null and @task_2_completed Is Not Null and @task_3_completed Is Not Null THEN
				insert into test_results (test_results_line) values ("SUCCESS: Initial Assertion Correct");
			ELSE
				insert into test_results (test_results_line) values ("FAILURE: Initial Assertion Incorrect");
			END IF;
		ELSE
            insert into test_results (test_results_line) values ("FAILURE: Initial Assertion Incorrect");
        END IF;
	ELSE
        insert into test_results (test_results_line) values ("FAILURE: Initial Assertion Incorrect");
   END IF;

	-- Create Task 4 on goal 2
	set @task_4_name = CONCAT("Task 4 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_2_id, 'item_name', @task_4_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_4_id from task where item_name = @task_4_name;

	-- Make sure the next condition of the right items being completed is true
	Select completed_dtm into @objective_1_completed from objective where objective_id = @objective_1_id;
	Select completed_dtm into @objective_2_completed from objective where objective_id = @objective_2_id;
	Select completed_dtm into @objective_3_completed from objective where objective_id = @objective_3_id;
	Select completed_dtm into @goal_1_completed from goal where goal_id = @goal_1_id;
	Select completed_dtm into @goal_2_completed from goal where goal_id = @goal_2_id;
	Select completed_dtm into @goal_3_completed from goal where goal_id = @goal_3_id;
	Select completed_dtm into @task_1_completed from task where task_id = @task_1_id;
	Select completed_dtm into @task_2_completed from task where task_id = @task_2_id;
	Select completed_dtm into @task_3_completed from task where task_id = @task_3_id;
	Select completed_dtm into @task_4_completed from task where task_id = @task_4_id;
	IF @objective_1_completed Is Null and @objective_2_completed Is Null and @objective_3_completed Is Not Null THEN
		IF @goal_1_completed Is Not Null and @goal_2_completed Is Null and @goal_3_completed Is Not Null THEN
			IF @task_1_completed Is Not Null and @task_2_completed Is Not Null and @task_3_completed Is Not Null and @task_4_completed Is Null THEN
				insert into test_results (test_results_line) values ("SUCCESS: Next Assertion Correct");
			ELSE
				insert into test_results (test_results_line) values ("FAILURE: Next Assertion Incorrect");
			END IF;
		ELSE
            insert into test_results (test_results_line) values ("FAILURE: Next Assertion Incorrect");
        END IF;
	ELSE
        insert into test_results (test_results_line) values ("FAILURE: Next Assertion Incorrect");
    END IF;

	-- Create Goal 4 on objective 3
    set @goal_4_name = CONCAT("Goal 4 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'item_name', @goal_4_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_4_id from goal where item_name = @goal_4_name;

	-- Make sure the final condition of the right items being completed is true
	Select completed_dtm into @objective_1_completed from objective where objective_id = @objective_1_id;
	Select completed_dtm into @objective_2_completed from objective where objective_id = @objective_2_id;
	Select completed_dtm into @objective_3_completed from objective where objective_id = @objective_3_id;
	Select completed_dtm into @goal_1_completed from goal where goal_id = @goal_1_id;
	Select completed_dtm into @goal_2_completed from goal where goal_id = @goal_2_id;
	Select completed_dtm into @goal_3_completed from goal where goal_id = @goal_3_id;
	Select completed_dtm into @goal_4_completed from goal where goal_id = @goal_4_id;
	Select completed_dtm into @task_1_completed from task where task_id = @task_1_id;
	Select completed_dtm into @task_2_completed from task where task_id = @task_2_id;
	Select completed_dtm into @task_3_completed from task where task_id = @task_3_id;
	Select completed_dtm into @task_4_completed from task where task_id = @task_4_id;
	IF @objective_1_completed Is Null and @objective_2_completed Is Null and @objective_3_completed Is Null THEN
		IF @goal_1_completed Is Not Null and @goal_2_completed Is Null and @goal_3_completed Is Not Null and @goal_4_completed Is Null THEN
			IF @task_1_completed Is Not Null and @task_2_completed Is Not Null and @task_3_completed Is Not Null and @task_4_completed Is Null THEN
				insert into test_results (test_results_line) values ("SUCCESS: Final Assertion Correct");
			ELSE
				insert into test_results (test_results_line) values ("FAILURE: Final Assertion Incorrect");
			END IF;
		ELSE
            insert into test_results (test_results_line) values ("FAILURE: Final Assertion Incorrect");
        END IF;
	ELSE
        insert into test_results (test_results_line) values ("FAILURE: Final Assertion Incorrect");
    END IF;


	DEALLOCATE PREPARE statement;
END //



DELIMITER ;