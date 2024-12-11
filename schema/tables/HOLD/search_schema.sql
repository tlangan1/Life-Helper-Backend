create table search_term (
	search_term_id uniqueidentifier DEFAULT NEWSEQUENTIALID() not null,
    create_dt datetime not null,
	CONSTRAINT PK_search_term PRIMARY KEY CLUSTERED (search_term_id),
)

create table task_search_term (
	task_id uniqueidentifier not null,
	search_term_id uniqueidentifier not null,
    create_dt datetime not null,
	search_term varchar(50) not null,
	CONSTRAINT PK_task_search_term PRIMARY KEY CLUSTERED (task_id, search_term_id),
)