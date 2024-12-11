-- A task can be required by one or more goals

drop table IF EXISTS goal_task;

create table goal_task (
	goal_id int not null,
	task_id int not null,
	deleted_dtm datetime null,
	create_dtm datetime default current_timestamp not null,
	PRIMARY KEY (goal_id, task_id)
);

-- Note, this code is unique to the exact change being implemented.
-- Since I am testing this script without making any changes to the structure
-- of the table the select is a simple select * from t_goal_task
insert into goal_task select * from t_goal_task;