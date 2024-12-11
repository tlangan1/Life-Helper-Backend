DROP PROCEDURE if exists p_drop_foreign_keys_for_table;

DELIMITER //
CREATE PROCEDURE p_drop_foreign_keys_for_table(IN table_name VARCHAR(50))
BEGIN
	set @temp_query = 'drop temporary table if exists temp_cursor_table';
	prepare pst from @temp_query;
	execute pst;
	drop prepare pst;

	set @temp_table_query='create temporary table temp_cursor_table ';
	set @temp_table_query=concat( @temp_table_query, ' SELECT constraint_name FROM information_schema.TABLE_CONSTRAINTS 
		WHERE TABLE_SCHEMA = ' );
	set @temp_table_query=concat( @temp_table_query, '"', database(), '"' );
	set @temp_table_query=concat( @temp_table_query, ' AND TABLE_CONSTRAINTS.CONSTRAINT_TYPE = "FOREIGN KEY"
		AND TABLE_NAME = ' );
	set @temp_table_query=concat( @temp_table_query, '"', table_name, '"');

	prepare pst from @temp_table_query;
	execute pst;
	drop prepare pst;
  
	BEGIN
		declare done int default false;
		declare foreign_key_name varchar(50);
		declare stmt1 varchar(1024);
		declare stmt2 varchar(1024);

		declare cur_fk cursor for select * from temp_cursor_table;
		
        declare continue handler for not found set done = 1;

		open cur_fk;
        
		fetch cur_fk into foreign_key_name;
		WHILE Not done DO
			select foreign_key_name;
            call p_drop_foreign_key(table_name, foreign_key_name);
			fetch cur_fk into foreign_key_name;
		END WHILE;
		
        close cur_fk;
	END;	
END //
DELIMITER ;