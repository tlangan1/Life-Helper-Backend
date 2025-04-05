drop procedure if exists p_migrate_thought;

DELIMITER //

create procedure p_migrate_thought()
	BEGIN
    insert into thought select thought_id, 2, thought,
        order_id, created_dtm, deleted_dtm, last_update_dtm
    from t_thought;
    END //

DELIMITER ;