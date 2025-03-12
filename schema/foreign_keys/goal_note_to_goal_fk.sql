alter table goal_note add constraint fk_goal_note_to_goal foreign key fk_goal_note_to_goal (goal_id) references goal(goal_id);
