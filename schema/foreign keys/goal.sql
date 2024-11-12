alter table goal add constraint fk_goal_to_objective_1 foreign key fk_goal_to_objective_1 (objective_id) references objective(objective_id);
