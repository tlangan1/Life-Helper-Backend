DROP PROCEDURE if exists p_drop_fk_and_idx;

DELIMITER //
CREATE PROCEDURE p_drop_fk_and_idx(IN item_name VARCHAR(50), IN t_name VARCHAR(50))
BEGIN
	SET @drop_fkSQL = CONCAT('alter table ', t_name, ' drop foreign key ', item_name);
	PREPARE prepared_statement FROM @drop_fkSQL;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;

	SET @drop_idxSQL = CONCAT('alter table ', t_name, ' drop index ', item_name);
	PREPARE prepared_statement FROM @drop_idxSQL ;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
END //

DELIMITER ;