drop procedure if exists p_migrate_goal;

DELIMITER //

create procedure p_migrate_goal()
	BEGIN
    insert into goal select goal_id, item_name, item_description, started_dtm
    , completed_dtm, aborted_dtm, null, created_dtm, 2, last_update_dtm from t_goal
	where aborted_dtm Is Null;

    insert into goal select goal_id, item_name, item_description, started_dtm
    , completed_dtm, aborted_dtm, 2, created_dtm, 2, last_update_dtm from t_goal
	where aborted_dtm Is Not Null;
    END //

DELIMITER ;