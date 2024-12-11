-- Every goal contains a collection of tasks
-- Every goal is a member of an objective

drop table if exists t_goal;

create table t_goal as select * from goal;

alter table task drop foreign key task_ibfk_1;

drop table IF EXISTS goal;

create table goal (
	goal_id int not null auto_increment,
	goal_name varchar(50) not null,
	goal_description varchar(1000) not null,
	objective_id int not null,
	started_dtm datetime null,
	completed_dtm datetime null,
	deleted_dtm datetime null,
	create_dtm datetime default current_timestamp not null,
	last_update_dtm datetime on update current_timestamp,
	PRIMARY KEY (goal_id)
);

alter table goal add foreign key fk_objective(objective_id) references objective(objective_id);

alter table task add foreign key fk_goal(goal_id) references goal(goal_id);

-- Note, this code is unique to the exact change being implemented.
-- Since I am testing this script without making any changes to the structure
-- of the table the select is a simple select * from t_goal
insert into goal select * from t_goal;