alter table objective add constraint fk_objective_creating_user_to_user_login
foreign key fk_objective_creating_user_to_user_login (creating_user) references user_login(user_login_id);

alter table objective add constraint fk_objective_aborting_user_to_user_login
foreign key fk_objective_aborting_user_to_user_login (canceling_user) references user_login(user_login_id);