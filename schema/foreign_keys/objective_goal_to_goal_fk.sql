alter table objective_goal add constraint fk_objective_goal_to_goal foreign key fk_objective_goal_to_goal (goal_id) references goal(goal_id);