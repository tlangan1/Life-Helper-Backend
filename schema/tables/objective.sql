-- Every objective contains a collection of goals
-- Every goal contains a collection of tasks

drop table if exists t_objective;

create table t_objective as select * from objective;

alter table goal drop foreign key goal_ibfk_1;

drop table IF EXISTS objective;

create table objective (
	objective_id int not null auto_increment,
	objective_name varchar(50) not null,
	objective_description varchar(1000) not null,
	started_dtm datetime null,
	completed_dtm datetime null,
	deleted_dtm datetime null,
	create_dtm datetime default current_timestamp not null,
	last_update_dtm datetime on update current_timestamp,
	PRIMARY KEY (objective_id)
);

alter table goal add foreign key fk_objective(objective_id) references objective(objective_id);

-- Note, this code is unique to the exact change being implemented.
-- Since I am testing this script without making any changes to the structure
-- of the table the select is a simple select * from t_objective
insert into objective select * from t_objective;