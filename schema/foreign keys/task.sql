alter table task add constraint fk_task_to_goal_1 foreign key (goal_id) references goal(goal_id);
