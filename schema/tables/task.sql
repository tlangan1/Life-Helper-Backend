-- Every task is a member of a goal
-- Every goal is a member of an objective

drop table IF EXISTS task;

create table task (
	task_id int not null auto_increment,
	task_name varchar(50) not null,
	task_description varchar(1000) not null,
	goal_id int not null,
	started_dtm datetime null,
	completed_dtm datetime null,
	deleted_dtm datetime null,
	create_dtm datetime default current_timestamp not null,
	last_update_dtm datetime on update current_timestamp,
	PRIMARY KEY (task_id)
);

alter table task add foreign key fk_goal(goal_id) references goal(goal_id);