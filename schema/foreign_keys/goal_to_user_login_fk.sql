alter table goal add constraint fk_goal_creating_user_to_user_login
foreign key fk_goal_creating_user_to_user_login (creating_user) references user_login(user_login_id);

alter table goal add constraint fk_goal_aborting_user_to_user_login
foreign key fk_goal_aborting_user_to_user_login (aborting_user) references user_login(user_login_id);