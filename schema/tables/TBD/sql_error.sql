-- This entity is a place for stored procedures to persist sql errors
-- If they are coded to use it.

drop table if exists t_sql_error;

create table t_sql_error as select * from sql_error;

drop table IF EXISTS sql_error;

create table sql_error (
	sql_error_id int not null auto_increment,
    sql_error varchar(1024) Not Null,
	stored_procedure_name varchar(50) not null,
	create_dtm datetime default current_timestamp not null,
	PRIMARY KEY (sql_error_id)
);

-- Note, this code is unique to the exact change being implemented.
-- Since I am testing this script without making any changes to the structure
-- of the table the select is a simple select * from t_sql_error
insert into sql_error select * from t_sql_error;