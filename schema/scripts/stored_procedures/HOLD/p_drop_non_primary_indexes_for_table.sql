DROP PROCEDURE if exists p_drop_non_primary_indexes_for_table;

DELIMITER //
CREATE PROCEDURE p_drop_non_primary_indexes_for_table(IN table_name VARCHAR(50))
BEGIN
	set @temp_query = 'drop temporary table if exists temp_cursor_table';
	prepare pst from @temp_query;
	execute pst;
	drop prepare pst;

	set @temp_table_query='CREATE TEMPORARY TABLE temp_cursor_table';
	set @temp_table_query = CONCAT(@temp_table_query, ' SELECT index_name FROM INFORMATION_SCHEMA.STATISTICS WHERE table_schema = ');
    set @temp_table_query = CONCAT(@temp_table_query, '"', database(), '"');
    set @temp_table_query = CONCAT(@temp_table_query, 'and table_name =');
    set @temp_table_query = CONCAT(@temp_table_query, '"', table_name, '"');
    set @temp_table_query = CONCAT(@temp_table_query, 'and index_name <> "PRIMARY"');
    

	prepare pst from @temp_table_query;
	execute pst;
	drop prepare pst;
  
	BEGIN
		declare done int default false;
		declare index_name varchar(50);
		declare stmt1 varchar(1024);
		declare stmt2 varchar(1024);

		declare cur_fk cursor for select * from temp_cursor_table;
		
        declare continue handler for not found set done = 1;

		open cur_fk;
        
		fetch cur_fk into index_name;
		WHILE Not done DO
			select index_name;
            call p_drop_index(table_name, index_name);
			fetch cur_fk into index_name;
		END WHILE;
		
        close cur_fk;
	END;	
END //
DELIMITER ;