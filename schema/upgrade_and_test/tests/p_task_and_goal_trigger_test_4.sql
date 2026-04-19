-- One potential flaw of this logic might be exposed if there is
-- already an objective or goal with any of the
-- names in the objectives and goals created below.

drop procedure if exists p_task_and_goal_trigger_test_4;

-- This test is designed to ensure the following data integrity rules.
--
-- If a task is canceled then any goal associated with that task which has
-- no other active tasks should be completed if any tasks associated with that
-- goal are in the completed state. However, if all tasks associated  with that
-- goal are in the canceled state then the goal should be canceled.
--
-- If a goal is canceled then any objective associated with that goal which has
-- no other active goals should be completed if any goals associated with that
-- objective are in the completed state. However, if all goals associated with that
-- objective are in the canceled state then the objective should be canceled.
--
-- In this test task 2 will be canceled.
-- This should cause goal 2 to be canceled but not goal 1 since task 1
-- is still active. Also, all the objectives should remain in the active state.
--
-- Next, task 1 will be canceled which should result in both goal 1 and goal 2 to be
-- in the canceled. Also, objective 3 should be in the canceled state.

DELIMITER //
create procedure p_task_and_goal_trigger_test_4()
	BEGIN
    set @test_name = "task and goal trigger test 4";
    select @test_name as running_test;
    -- DO NOT change this variable name to @user_login_id. Things will break.
    set @login_id = 2;

    insert into test_results (test_results_line) values (CONCAT("Beginning: ", @test_name));
	set @objective_description = "Some Description";

	-- Create Objective 1
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

	-- Create Goal 1 as a goal of Objective 2
	set @goal_description = "Some Goal Description";
	set @goal_1_name = CONCAT("Goal 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_2_id, 'item_name', @goal_1_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_1_id from goal where item_name = @goal_1_name;

	-- Create Goal 2 as a goal of Objective 3
	set @goal_2_name = CONCAT("Goal 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'item_name', @goal_2_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_2_id from goal where item_name = @goal_2_name;

	-- Create Goal 3 as a goal of Objective 2
	set @goal_3_name = CONCAT("Goal 3 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @objective_2_id, 'item_name', @goal_3_name, 'item_description', @goal_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("goal", ?)';
	Execute statement using @JSON;
    select goal_id into @goal_3_id from goal where item_name = @goal_3_name;

	-- Attach Goal 1 to Objective 3
	set @JSON = JSON_OBJECT('parent_id', @objective_3_id, 'child_id', @goal_1_id);
	PREPARE statement FROM 'call p_attach_item("goal", ?)';
	Execute statement using @JSON;

	-- Create Task 1 as a task of Goal 1
	set @task_description = "Task Desc.";
	set @task_1_name = CONCAT("Task 1 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_1_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_1_id from task where item_name = @task_1_name;

	-- Create Task 2 as a task of Goal 1
	set @task_2_name = CONCAT("Task 2 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_2_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_2_id from task where item_name = @task_2_name;

	-- Create Task 3 as a task of Goal 3
	set @task_3_name = CONCAT("Task 3 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_3_id, 'item_name', @task_3_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_3_id from task where item_name = @task_3_name;

    -- Attach Task 2 to Goal 2
	set @JSON = JSON_OBJECT('parent_id', @goal_2_id, 'child_id', @task_2_id);
	PREPARE statement FROM 'call p_attach_item("task", ?)';
	Execute statement using @JSON;

	-- Start Task 2
	set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_2_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Start Task 1
	set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_1_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Make sure the initial condition are true
	Select count(*) into @count from objective where objective_id in (@objective_1_id, @objective_2_id, @objective_3_id)
    and canceled_dtm Is Null;
	Select canceled_dtm into @goal_1_canceled from goal where goal_id = @goal_1_id;
	Select canceled_dtm into @goal_2_canceled from goal where goal_id = @goal_2_id;
	Select canceled_dtm into @goal_3_canceled from goal where goal_id = @goal_3_id;
	Select canceled_dtm into @task_1_canceled from task where task_id = @task_1_id;
	Select canceled_dtm into @task_2_canceled from task where task_id = @task_2_id;
	Select canceled_dtm into @task_3_canceled from task where task_id = @task_3_id;
	IF @count = 3 THEN
        IF @goal_1_canceled Is Null and @goal_2_canceled Is Null and @goal_3_canceled Is Null THEN
			IF @task_1_canceled Is Null and @task_2_canceled Is Null and @task_3_canceled Is Null THEN
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

	-- Cancel Task 2
	set @JSON = JSON_OBJECT('update_type', 'cancel', 'item_id', @task_2_id, 'user_login_id', @login_id);

	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Make sure the next assertion is true, task 2 is canceled and goal 2 is canceled.
	Select canceled_dtm into @objective_1_canceled from objective where objective_id = @objective_1_id;
	Select canceled_dtm into @objective_2_canceled from objective where objective_id = @objective_2_id;
	Select canceled_dtm into @objective_3_canceled from objective where objective_id = @objective_3_id;
	Select canceled_dtm into @goal_1_canceled from goal where goal_id = @goal_1_id;
	Select canceled_dtm into @goal_2_canceled from goal where goal_id = @goal_2_id;
	Select canceled_dtm into @goal_3_canceled from goal where goal_id = @goal_3_id;
	Select canceled_dtm into @task_1_canceled from task where task_id = @task_1_id;
	Select canceled_dtm into @task_2_canceled from task where task_id = @task_2_id;
	Select canceled_dtm into @task_3_canceled from task where task_id = @task_3_id;
	IF @objective_1_canceled Is Null and @objective_2_canceled Is Null and @objective_3_canceled Is Null THEN
		IF @goal_1_canceled Is Null and @goal_2_canceled Is Not Null and @goal_3_canceled Is Null THEN
			IF @task_1_canceled Is Null and @task_2_canceled Is Not Null and @task_3_canceled Is Null THEN
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

    select "before canceling task 1" as diagnostic;

	-- Cancel Task 1
	set @JSON = JSON_OBJECT('update_type', 'cancel', 'item_id', @task_1_id, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_update_item("task", ?)';
	Execute statement using @JSON;

	-- Make sure the final assertion is true, task 1 and task 2 are canceled
	-- , goal 1 and goal 2 are canceled, and objective 3 is canceled.
	Select canceled_dtm into @objective_1_canceled from objective where objective_id = @objective_1_id;
	Select canceled_dtm into @objective_2_canceled from objective where objective_id = @objective_2_id;
	Select canceled_dtm into @objective_3_canceled from objective where objective_id = @objective_3_id;
	Select canceled_dtm into @goal_1_canceled from goal where goal_id = @goal_1_id;
	Select canceled_dtm into @goal_2_canceled from goal where goal_id = @goal_2_id;
	Select canceled_dtm into @goal_3_canceled from goal where goal_id = @goal_3_id;
	Select canceled_dtm into @task_1_canceled from task where task_id = @task_1_id;
	Select canceled_dtm into @task_2_canceled from task where task_id = @task_2_id;
	Select canceled_dtm into @task_3_canceled from task where task_id = @task_3_id;
	IF @objective_1_canceled Is Null and @objective_2_canceled Is Null and @objective_3_canceled Is Not Null THEN
		IF @goal_1_canceled Is Not Null and @goal_2_canceled Is Not Null and @goal_3_canceled Is Null THEN
			IF @task_1_canceled Is Not Null and @task_2_canceled Is Not Null and @task_3_canceled Is Null THEN
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

	-- Create Task 4 as a task of Goal 1
	set @task_4_name = CONCAT("Task 4 for ", @test_name);
	set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_4_name, 'item_description', @task_description, 'user_login_id', @login_id);
	PREPARE statement FROM 'call p_add_item("task", ?)';
	Execute statement using @JSON;
    select task_id into @task_4_id from task where item_name = @task_4_name;


	-- Make sure the final assertion is true, task 1 and task 2 are canceled,
	-- goal 2 is canceled and no objectives are canceled.
	Select canceled_dtm into @objective_1_canceled from objective where objective_id = @objective_1_id;
	Select canceled_dtm into @objective_2_canceled from objective where objective_id = @objective_2_id;
	Select canceled_dtm into @objective_3_canceled from objective where objective_id = @objective_3_id;
	Select canceled_dtm into @goal_1_canceled from goal where goal_id = @goal_1_id;
	Select canceled_dtm into @goal_2_canceled from goal where goal_id = @goal_2_id;
	Select canceled_dtm into @goal_3_canceled from goal where goal_id = @goal_3_id;
	Select canceled_dtm into @task_1_canceled from task where task_id = @task_1_id;
	Select canceled_dtm into @task_2_canceled from task where task_id = @task_2_id;
	Select canceled_dtm into @task_3_canceled from task where task_id = @task_3_id;
	Select canceled_dtm into @task_4_canceled from task where task_id = @task_4_id;
	IF @objective_1_canceled Is Null and @objective_2_canceled Is Null and @objective_3_canceled Is Null THEN
		IF @goal_1_canceled Is Null and @goal_2_canceled Is Not Null and @goal_3_canceled Is Null THEN
			IF @task_1_canceled Is Not Null and @task_2_canceled Is Not Null and @task_3_canceled Is Null and @task_4_canceled Is Null THEN
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