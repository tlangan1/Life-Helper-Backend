use test_life_helper;

drop table IF EXISTS test_results;

create table test_results (
	test_results_line varchar(100) not null,
	create_dtm datetime default current_timestamp not null
);
