-- Every objective contains a collection of zero or more goals
-- Every goal contains a collection of zero or more tasks

DROP PROCEDURE if exists p_create_table;

DELIMITER //

CREATE PROCEDURE p_create_table(IN t_name VARCHAR(50), IN preserve_data bool)
	BEGIN
		declare sp_name varchar(50) default 'p_create_table';
		declare target_table_exists bool default false;

		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN
				select CONCAT("An exception occurred in ", sp_name) as stored_procedure_name, t_name as table_name;
				GET STACKED DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
					@errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
				SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
				select @full_error;
				INSERT INTO sql_error (sql_error, stored_procedure_name, additional_information, created_dtm) values (@full_error, sp_name, CONCAT('table name: ', t_name), now());
			END;
        
		SELECT true into target_table_exists FROM information_schema.tables WHERE table_schema = database() and table_name = t_name ;
        
		-- drop table if exists t_objective;
       	SET @SQL = CONCAT('drop table if exists t_', t_name);
		PREPARE prepared_statement FROM @SQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;

        IF target_table_exists AND preserve_data THEN
            -- create table t_objective select * from objective;
			SET @SQL = CONCAT('create table t_', t_name, ' select * from ', t_name);
			PREPARE prepared_statement FROM @SQL;
			EXECUTE prepared_statement;
			DEALLOCATE PREPARE prepared_statement;
		END IF;
        
-- 		call p_create_objective();
       	SET @SQL = CONCAT('call p_create_', t_name, '()');
		PREPARE prepared_statement FROM @SQL;
		EXECUTE prepared_statement;
		DEALLOCATE PREPARE prepared_statement;
        
        IF target_table_exists AND preserve_data THEN
			-- Note, the code in the called stored procedures is unique
            -- to the exact change being implemented.
			-- When not making any changes to the structure of a table the
			-- they should contain a simple 
            -- insert into [table name] select * from t_[table name] statement

-- 			insert into [table name] select * from t_[table name];
			SET @SQL = CONCAT('call p_migrate_', t_name, '()');
			PREPARE prepared_statement FROM @SQL;
			EXECUTE prepared_statement;
			DEALLOCATE PREPARE prepared_statement;
		END IF;
	END //

DELIMITER ;
