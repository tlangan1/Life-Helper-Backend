DROP PROCEDURE if exists p_create_user_login;

DELIMITER //

CREATE PROCEDURE p_create_user_login()
	BEGIN
    drop table if exists user_login;
    
	create table user_login (
		user_login_id int not null auto_increment,
		user_name varchar(30) not null,
        hashed_password varchar(100) not null,
		full_name varchar(100) not null,
		display_name varchar(30) not null,
		create_dtm datetime default current_timestamp not null,
		deleted_dtm datetime null,
		PRIMARY KEY (user_login_id)
	);
	END //

DELIMITER ;
