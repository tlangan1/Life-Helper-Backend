drop procedure if exists p_add_work_log_to_user_login_fk;

DELIMITER //
create procedure p_add_work_log_to_user_login_fk()
	BEGIN
	alter table work_log add constraint fk_work_log_to_user_login foreign key fk_work_log_to_user_login (user_login_id) references user_login(user_login_id);
    END //

DELIMITER ;
