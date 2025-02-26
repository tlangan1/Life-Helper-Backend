drop procedure if exists p_add_task_user_to_user_login_fk;

DELIMITER //
create procedure p_add_task_user_to_user_login_fk()
	BEGIN
	alter table task_user add constraint fk_task_user_to_user_login foreign key fk_task_user_to_user_login (user_login_id) references user_login(user_login_id);
    END //

DELIMITER ;
