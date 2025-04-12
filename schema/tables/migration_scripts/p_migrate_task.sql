drop procedure if exists p_migrate_task;

DELIMITER //

create procedure p_migrate_task()
	BEGIN
    insert into task select task_id, item_name, item_description, started_dtm, null, paused_dtm
    , completed_dtm, null, aborted_dtm, null, created_dtm, 2, last_update_dtm from t_task
	where started_dtm Is Null
    and   aborted_dtm Is Null;

    insert into task select task_id, item_name, item_description, started_dtm, 2, paused_dtm
    , completed_dtm, null, aborted_dtm, null, created_dtm, 2, last_update_dtm from t_task
	where started_dtm Is Not Null
    and completed_dtm Is Null
    and aborted_dtm Is Null;

    insert into task select task_id, item_name, item_description, started_dtm, 2, paused_dtm
    , completed_dtm, 2, aborted_dtm, null, created_dtm, 2, last_update_dtm from t_task
	where started_dtm Is Not Null
    and completed_dtm Is Not Null;

    insert into task select task_id, item_name, item_description, started_dtm, 2, paused_dtm
    , completed_dtm, null, aborted_dtm, 2, created_dtm, 2, last_update_dtm from t_task
	where started_dtm Is Not Null
    and aborted_dtm Is Not Null;

    insert into task select task_id, item_name, item_description, started_dtm, null, paused_dtm
    , completed_dtm, null, aborted_dtm, 2, created_dtm, 2, last_update_dtm from t_task
	where started_dtm Is Null
    and aborted_dtm Is Not Null;
    END //

DELIMITER ;