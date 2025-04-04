DROP PROCEDURE IF exists p_update_thought;

DELIMITER //
CREATE PROCEDURE p_update_thought(IN data JSON)
BEGIN
	set @update_type = JSON_UNQUOTE(JSON_EXTRACT(data, '$.update_type'));

	CASE @update_type
		WHEN "delete" THEN
			update thought set deleted_dtm = now() where thought_id = JSON_EXTRACT(data, '$.thought_id');
		WHEN "update" THEN
			update thought set thought = JSON_UNQUOTE(JSON_EXTRACT(data, '$.thought'))
            where thought_id = JSON_EXTRACT(data, '$.thought_id');
	END CASE;
    commit;
END //

DELIMITER ;
