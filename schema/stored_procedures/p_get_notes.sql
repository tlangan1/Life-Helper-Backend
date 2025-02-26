DROP PROCEDURE IF exists p_get_notes;

DELIMITER //
CREATE PROCEDURE p_get_notes(IN data JSON)
BEGIN
	Set @type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.item_type'));
    Set @item_id = JSON_EXTRACT(data, '$.item_id');

	SET @SQL = CONCAT('select n.note from ', @type);
    SET @SQL = CONCAT(@SQL, ' x inner join ', @type);
    SET @SQL = CONCAT(@SQL, '_note xn on x.', @type);
    SET @SQL = CONCAT(@SQL, '_id = xn.', @type, '_id');
    SET @SQL = CONCAT(@SQL, ' inner join note n on xn.note_id = n.note_id');
    SET @SQL = CONCAT(@SQL, ' where x.', @type, '_id = ', @item_id);
    SET @SQL = CONCAT(@SQL, ' order by n.created_dtm desc');

	PREPARE prepared_statement FROM @SQL;
	EXECUTE prepared_statement;
	DEALLOCATE PREPARE prepared_statement;
END //
DELIMITER ;
