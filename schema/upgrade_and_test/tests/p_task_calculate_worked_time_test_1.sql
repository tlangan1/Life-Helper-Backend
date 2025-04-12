-- One potential flaw of this logic might be exposed if there is
-- an objective or goal imported from production with the same
-- names as one of the objectives and/or goals created below.

drop procedure if exists p_task_calculate_worked_time_test_1;

DELIMITER //
create procedure p_task_calculate_worked_time_test_1()
	BEGIN
    set @test_name = "calculate worked time test 1";
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

	-- Create Goal 1
	set @goal_description = "Some Goal Description";
	set @goal_1_name = CONCAT("Goal 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_1_id, 'item_name', @goal_1_name, 'item_description', @goal_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_1_id from goal where item_name = @goal_1_name;

	-- Create Task 1
	set @task_description = "Task Desc.";
	set @task_1_name = CONCAT("Task 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_1_name, 'item_description', @task_description, 'user_login_id', @user_login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_1_id from task where item_name = @task_1_name;

	DEALLOCATE PREPARE statement;

	-- Make sure the initial condition of nothing being started is true
	Select count(*) into @count from objective where objective_id in (@objective_1_id)
    and started_dtm Is Not Null;
	IF @count = 0 THEN
		Select count(*) into @count from goal where goal_id in (@goal_1_id)
		and started_dtm Is Not Null;
        IF @count = 0 THEN
			Select count(*) into @count from task where task_id in (@task_1_id)
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

    -- set a timer for 2 seconds
    select sleep(2);

    -- Pause Task 1
    set @JSON = JSON_OBJECT('update_type', 'pause', 'item_id', @task_1_id, 'user_login_id', @user_login_id);
    PREPARE statement FROM 'call p_update_item("task", ?)';
    Execute statement using @JSON;

    -- Make sure the next condition of the right items being paused is true
    Select paused_dtm into @task_1_paused from task where task_id = @task_1_id;
    IF @task_1_paused Is Not Null THEN
        insert into test_results (test_results_line) values ("SUCCESS: Next Assertion Correct");
    ELSE
        insert into test_results (test_results_line) values ("FAILURE: Next Assertion Incorrect");
    END IF;

    -- Make sure the final condition of the elapsed work time of 10 seconds is true
    Select timediff(stopped_work_dtm, started_work_dtm) into @elapsed_time from work_log where task_id = @task_1_id;
    IF SECOND(@elapsed_time) = 2 THEN
        insert into test_results (test_results_line) values ("SUCCESS: Final Assertion Correct");
    ELSE
        insert into test_results (test_results_line) values ("FAILURE: Final Assertion Incorrect");
    END IF;
END //



DELIMITER ;