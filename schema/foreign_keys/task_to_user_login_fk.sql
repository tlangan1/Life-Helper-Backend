alter table task add constraint fk_task_creating_user_to_user_login
foreign key fk_task_creating_user_to_user_login (creating_user) references user_login(user_login_id);

alter table task add constraint fk_task_starting_user_to_user_login
foreign key fk_task_starting_user_to_user_login (starting_user) references user_login(user_login_id);

alter table task add constraint fk_task_completing_user_to_user_login
foreign key fk_task_completing_user_to_user_login (completing_user) references user_login(user_login_id);

alter table task add constraint fk_task_aborting_user_to_user_login
foreign key fk_task_aborting_user_to_user_login (canceling_user) references user_login(user_login_id);