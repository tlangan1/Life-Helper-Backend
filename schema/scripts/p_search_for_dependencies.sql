drop procedure if exists p_search_for_dependencies;

DELIMITER //

create procedure p_search_for_dependencies(IN pattern varchar(100))
	BEGIN
	SET @dependencySQL = CONCAT('SELECT ROUTINE_NAME
		FROM information_schema.ROUTINES
		WHERE ROUTINE_TYPE="PROCEDURE"
		AND ROUTINE_SCHEMA = ', "'", database(), "'",
		' AND ROUTINE_DEFINITION LIKE ', "'%", pattern, "%'");
        
	select @dependencySQL;
	PREPARE prepared_statement FROM @dependencySQL;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
	END //

DELIMITER ;
