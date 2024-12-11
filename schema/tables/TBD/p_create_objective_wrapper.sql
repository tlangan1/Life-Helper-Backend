-- Every objective contains a collection of zero or more goals
-- Every goal contains a collection of zero or more tasks


DROP PROCEDURE if exists p_create_objective_wrapper;

DELIMITER //

CREATE PROCEDURE p_create_objective_wrapper()
	BEGIN
		declare target_table_exists bool default false;
        
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN
				select "An exception occurred in p_create_objective";
				GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
					@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
				SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
				select @full_error;
				INSERT INTO sql_error (sql_error, stored_procedure_name, create_dtm) values (@full_error, 'p_drop_index', now());
			END;
        
		SELECT true into target_table_exists FROM information_schema.tables 
        WHERE table_schema = database() AND table_name = 'objective';
        
		drop table if exists t_objective;
        
        IF target_table_exists THEN
            create table t_objective select * from objective;
		END IF;
        
		drop table if exists objective;

		call p_create_objective();
-- 		create table objective (
-- 			objective_id int not null auto_increment,
-- 			objective_name varchar(50) not null,
-- 			objective_description varchar(1000) not null,
-- 			started_dtm datetime null,
-- 			completed_dtm datetime null,
-- 			deleted_dtm datetime null,
-- 			create_dtm datetime default current_timestamp not null,
-- 			last_update_dtm datetime on update current_timestamp,
-- 			PRIMARY KEY (objective_id)
-- 		);
        
        IF target_table_exists THEN
			-- Note, this code is unique to the exact change being implemented.
			-- When not making any changes to the structure of the table the
			-- select to use is a simple select * from t_objective
			insert into objective select * from t_objective;
		END IF;
	END //

DELIMITER ;
