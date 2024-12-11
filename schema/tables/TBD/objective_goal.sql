-- A goal can be required by one or more objectives

drop table IF EXISTS objective_goal;

create table objective_goal (
	objective_id int not null,
	goal_id int not null,
	deleted_dtm datetime null,
	create_dtm datetime default current_timestamp not null,
	PRIMARY KEY (objective_id, goal_id)
);

-- Note, this code is unique to the exact change being implemented.
-- Since I am testing this script without making any changes to the structure
-- of the table the select is a simple select * from t_objective_goal
insert into objective_goal select * from t_objective_goal;