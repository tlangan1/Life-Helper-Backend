alter table work_log add constraint fk_work_log_to_task_user foreign key fk_work_log_to_task_user (task_id, user_login_id) references task_user(task_id, user_login_id);
