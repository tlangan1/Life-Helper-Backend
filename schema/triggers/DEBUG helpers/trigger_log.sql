drop table if exists trigger_log;

create table trigger_log (
	trigger_log_id int not null auto_increment,
    statement varchar(100) default null,
    integer_result int default null,
    string_result varchar(100) default null,
	create_dtm datetime default current_timestamp not null,
	PRIMARY KEY (trigger_log_id)
	);
