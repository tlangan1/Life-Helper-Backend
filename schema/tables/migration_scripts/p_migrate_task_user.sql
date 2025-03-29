drop procedure if exists p_migrate_task_user;

DELIMITER //

create procedure p_migrate_task_user()
	BEGIN
    DECLARE done BOOL DEFAULT false;
    DECLARE id int;
	DECLARE cur_task_user CURSOR for
    select tu.task_id from task t inner join task_user tu on t.task_id = tu.task_id
    where t.started_dtm is not null
    and t.completed_dtm is null
    and t.deleted_dtm is null
    -- This procedure assumes there is only one user with user_login_id = 2
    and tu.user_login_id = 2;

    -- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
	FOR NOT FOUND SET done = true;

    insert into task_user (task_id,	user_login_id, order_id, start_assignment_dtm, end_assignment_dtm, created_dtm)
    select task_id,	user_login_id, 0, start_assignment_dtm, end_assignment_dtm, created_dtm from t_task_user;

	set @order_id = 0;

	-- open the cursor
	OPEN cur_task_user;
	
	FETCH cur_task_user into id;
	WHILE Not done DO
		set @order_id = @order_id + 1;
		
        update task_user set order_id = @order_id
        where task_id = id;
		
        FETCH cur_task_user into id;
	END WHILE;

	-- close the cursor
	CLOSE cur_task_user;


    END //

DELIMITER ;