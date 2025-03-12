drop table IF EXISTS test_results;

create table test_results (
	test_results_line varchar(100) not null,
	created_dtm datetime default current_timestamp not null
);
