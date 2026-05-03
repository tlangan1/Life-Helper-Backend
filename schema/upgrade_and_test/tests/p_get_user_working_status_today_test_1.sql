drop procedure if exists p_get_user_working_status_today_test_1;

DELIMITER //
create procedure p_get_user_working_status_today_test_1()
BEGIN
    -- set @test_name = "get user working status today test 1";
    -- I had to shorten the name because it was too long for the objective name column.
    set @test_name = "user working status today test 1";
    select @test_name as running_test;
    set @user_login_id = 4;
    set @sleep_seconds = 2.0;

    insert into test_results (test_results_line) values (CONCAT("Beginning: ", @test_name));

    -- Assert null user id is handled safely by the shared procedure.
    call p_get_user_working_status_today(NULL, @user_working, @elapsed_work_time);
    IF @user_working = FALSE and @elapsed_work_time = 0 THEN
        insert into test_results (test_results_line) values ("SUCCESS: Initial Assertion Correct");
    ELSE
        insert into test_results (test_results_line) values ("FAILURE: Initial Assertion Incorrect");
    END IF;

    -- Create one objective, one goal, and one task.
    set @objective_description = "Some Description";
    set @objective_1_name = CONCAT("Objective 1 for ", @test_name);
    set @JSON = JSON_OBJECT('parent_id', 0, 'item_name', @objective_1_name, 'item_description', @objective_description, 'user_login_id', @user_login_id);
    PREPARE statement FROM 'call p_add_item("objective", ?)';
    Execute statement using @JSON;
    select objective_id into @objective_1_id from objective where item_name = @objective_1_name;

    set @goal_description = "Some Goal Description";
    set @goal_1_name = CONCAT("Goal 1 for ", @test_name);
    set @JSON = JSON_OBJECT('parent_id', @objective_1_id, 'item_name', @goal_1_name, 'item_description', @goal_description, 'user_login_id', @user_login_id);
    PREPARE statement FROM 'call p_add_item("goal", ?)';
    Execute statement using @JSON;
    select goal_id into @goal_1_id from goal where item_name = @goal_1_name;

    set @task_description = "Task Desc.";
    set @task_1_name = CONCAT("Task 1 for ", @test_name);
    set @JSON = JSON_OBJECT('parent_id', @goal_1_id, 'item_name', @task_1_name, 'item_description', @task_description, 'user_login_id', @user_login_id);
    PREPARE statement FROM 'call p_add_item("task", ?)';
    Execute statement using @JSON;
    select task_id into @task_1_id from task where item_name = @task_1_name;

    -- Start the task and give it a short active interval.
    set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_1_id, 'user_login_id', @user_login_id);
    PREPARE statement FROM 'call p_update_item("task", ?)';
    Execute statement using @JSON;

    select sleep(@sleep_seconds);

    SELECT TIMESTAMPDIFF(SECOND, started_work_dtm, IFNULL(stopped_work_dtm, NOW()))
    INTO @elapsed_seconds
    FROM work_log
    WHERE task_id = @task_1_id
    AND stopped_work_dtm IS NULL
    ORDER BY started_work_dtm DESC
    LIMIT 1;

    call p_get_user_working_status_today(@user_login_id, @user_working, @elapsed_work_time);
    IF @user_working = TRUE and @elapsed_seconds >= @sleep_seconds THEN
        insert into test_results (test_results_line) values ("SUCCESS: Next Assertion Correct");
    ELSE
        insert into test_results (test_results_line) values ("FAILURE: Next Assertion Incorrect");
    END IF;

    -- Pause task and assert user is no longer working while elapsed time remains.
    set @JSON = JSON_OBJECT('update_type', 'pause', 'item_id', @task_1_id, 'user_login_id', @user_login_id);
    PREPARE statement FROM 'call p_update_item("task", ?)';
    Execute statement using @JSON;

    DEALLOCATE PREPARE statement;

    SELECT TIMESTAMPDIFF(SECOND, started_work_dtm, stopped_work_dtm)
    INTO @elapsed_seconds
    FROM work_log
    WHERE task_id = @task_1_id
    ORDER BY started_work_dtm DESC
    LIMIT 1;

    call p_get_user_working_status_today(@user_login_id, @user_working, @elapsed_work_time);
    IF @user_working = FALSE and @elapsed_seconds >= @sleep_seconds THEN
        insert into test_results (test_results_line) values ("SUCCESS: Final Assertion Correct");
    ELSE
        insert into test_results (test_results_line) values ("FAILURE: Final Assertion Incorrect");
    END IF;
END //
DELIMITER ;
