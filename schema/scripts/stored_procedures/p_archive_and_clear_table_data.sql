drop procedure if exists p_archive_and_clear_table_data;

DELIMITER //
CREATE  PROCEDURE p_archive_and_clear_table_data(IN table_name VARCHAR(50) )
BEGIN
 SET @drop_archive_tableSQL = CONCAT('drop table if exists t_', table_name);
 PREPARE prepared_statement FROM @drop_archive_tableSQL;
 EXECUTE prepared_statement;
 DEALLOCATE PREPARE prepared_statement;

 SET @archiveSQL = CONCAT('create table t_', table_name, ' as select * from ', table_name);
 PREPARE prepared_statement FROM @archiveSQL;
 EXECUTE prepared_statement;
 DEALLOCATE PREPARE prepared_statement;

 SET @deleteSQL = CONCAT('delete from ', table_name);
 PREPARE prepared_statement FROM @deleteSQL;
 EXECUTE prepared_statement;
 DEALLOCATE PREPARE prepared_statement;
END //