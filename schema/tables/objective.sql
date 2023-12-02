-- Every objective contains a collection of goals
-- Every goal contains a collection of tasks

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