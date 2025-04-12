-- One potential flaw of this logic might be exposed if there is
-- an objective or goal imported from production with the same
-- names as one of the objectives and/or goals created below.

drop procedure if exists p_task_and_goal_trigger_test_1;

DELIMITER //
create procedure p_task_and_goal_trigger_test_1()
	BEGIN
    set @test_name = "task and goal trigger test 1";
    select @test_name as running_test;
    set @user_login_id = 2;

    insert into test_results (test_results_line) values (CONCAT("Beginning: ", @test_name));
	-- Create Objective 1
	set @objective_description = "Some Description";
	set @objective_1_name = CONCAT("Objective 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_1_name, 'item_description', @objective_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_1_id from objective where item_name = @objective_1_name;

	-- Create Objective 2
	set @objective_2_name = CONCAT("Objective 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_2_name, 'item_description', @objective_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_2_id from objective where item_name = @objective_2_name;

	-- Create Objective 3
	set @objective_3_name = CONCAT("Objective 3 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_3_name, 'item_description', @objective_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("objective", ?)';
	Execute statement using @JSON;
    select objective_id into @objective_3_id from objective where item_name = @objective_3_name;

	-- Create Goal 1
	set @goal_description = "Some Goal Description";
	set @goal_1_name = CONCAT("Goal 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_2_id, 'item_name', @goal_1_name, 'item_description', @goal_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_1_id from goal where item_name = @goal_1_name;

	-- Create Goal 2
	set @goal_2_name = CONCAT("Goal 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'item_name', @goal_2_name, 'item_description', @goal_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_2_id from goal where item_name = @goal_2_name;

	-- Attach Goal 1 to Objective 3
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'child_id', @goal_1_id);
	PREPARE statement FROM 'call p_attach_item("goal", ?)';
	Execute statement using @JSON;

	-- Create Task 1
	set @task_description = "Task Desc.";
	set @task_1_name = CONCAT("Task 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_1_name, 'item_description', @task_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_1_id from task where item_name = @task_1_name;

	-- Create Task 2
	set @task_2_name = CONCAT("Task 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_2_name, 'item_description', @task_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_2_id from task where item_name = @task_2_name;

	-- Attach Task 2 to Goal 2
	set @JSON = JSON_OBJECT('parent_id', @goal_2_id, 'child_id', @task_2_id);
	PREPARE statement FROM 'call p_attach_item("task", ?)';
	Execute statement using @JSON;

	DEALLOCATE PREPARE statement;

	-- Make sure the initial condition of nothing being started is true
	Select count(*) into @count from objective where objective_id in (@objective_1_id, @objective_2_id, @objective_3_id)
    and started_dtm Is Not Null;
	IF @count = 0 THEN
		Select count(*) into @count from goal where goal_id in (@goal_1_id, @goal_2_id)
		and started_dtm Is Not Null;
        IF @count = 0 THEN
			Select count(*) into @count from task where task_id in (@task_1_id, @task_2_id)
			and started_dtm Is Not Null;
			IF @count = 0 THEN
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

	-- Start Task 1
	set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_1_id, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Make sure the final condition of the right items being started is true
	Select started_dtm into @objective_1_started from objective where objective_id = @objective_1_id;
	Select started_dtm into @objective_2_started from objective where objective_id = @objective_2_id;
	Select started_dtm into @objective_3_started from objective where objective_id = @objective_3_id;
	Select started_dtm into @goal_1_started from goal where goal_id = @goal_1_id;
	Select started_dtm into @goal_2_started from goal where goal_id = @goal_2_id;
	Select started_dtm into @task_1_started from task where task_id = @task_1_id;
	Select started_dtm into @task_2_started from task where task_id = @task_2_id;

	IF @objective_1_started Is Null and @objective_2_started Is Not Null and @objective_3_started Is Not Null THEN
		IF @goal_1_started Is Not Null and @goal_2_started Is Null THEN
			IF @task_1_started Is Not Null and @task_2_started Is Null THEN
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
END //



DELIMITER ;