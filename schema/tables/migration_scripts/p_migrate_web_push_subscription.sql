drop procedure if exists p_migrate_web_push_subscription;

DELIMITER //

create procedure p_migrate_web_push_subscription()
	BEGIN
    insert into web_push_subscription select * from t_web_push_subscription;
    END //

DELIMITER ;