DROP PROCEDURE IF exists p_search_items;

DELIMITER //
CREATE PROCEDURE p_search_items(IN data JSON)
BEGIN
    DECLARE v_search_text VARCHAR(1000);
    DECLARE v_search_locations JSON;
    DECLARE v_entity_count INT DEFAULT 0;
    DECLARE v_entity_index INT DEFAULT 0;
    DECLARE v_column_count INT DEFAULT 0;
    DECLARE v_column_index INT DEFAULT 1;
    DECLARE v_entity_name VARCHAR(64);
    DECLARE v_column_name VARCHAR(64);
    DECLARE v_id_column VARCHAR(80);

    SET v_search_text = JSON_UNQUOTE(JSON_EXTRACT(data, '$.search_text'));
    SET v_search_locations = JSON_EXTRACT(data, '$.search_locations');

    -- search_locations should look like this:
    -- [
    --   ["objective", "item_name", "item_description"],
    --   ["goal", "item_name", "item_description"],
    --   ["task", "item_name", "item_description"],
    --   ["note", "note"],
    --   ["thought", "thought"]
    -- ]

    DROP TEMPORARY TABLE IF EXISTS t_search_results;
    CREATE TEMPORARY TABLE t_search_results (
        entity_name VARCHAR(64) NOT NULL,
        item_id INT NOT NULL,
        matched_column VARCHAR(64) NOT NULL,
        matched_text VARCHAR(1000) NOT NULL
    );

    IF v_search_text IS NULL OR v_search_text = '' OR v_search_locations IS NULL THEN
        SELECT * FROM t_search_results;
    ELSE
        SET @search_pattern = CONCAT('%', v_search_text, '%');
        SET v_entity_count = JSON_LENGTH(v_search_locations);

        WHILE v_entity_index < v_entity_count DO
            SET v_entity_name = JSON_UNQUOTE(JSON_EXTRACT(v_search_locations, CONCAT('$[', v_entity_index, '][0]')));
            SET v_column_count = JSON_LENGTH(JSON_EXTRACT(v_search_locations, CONCAT('$[', v_entity_index, ']')));
            SET v_column_index = 1;

            IF v_entity_name REGEXP '^[a-z_]+$' THEN
                SET v_id_column = CONCAT(v_entity_name, '_id');

                WHILE v_column_index < v_column_count DO
                    SET v_column_name = JSON_UNQUOTE(JSON_EXTRACT(v_search_locations, CONCAT('$[', v_entity_index, '][', v_column_index, ']')));

                    IF v_column_name REGEXP '^[a-z_]+$' THEN
                        SET @sql = CONCAT(
                            'INSERT INTO t_search_results (entity_name, item_id, matched_column, matched_text) ',
                            'SELECT ''', v_entity_name, ''', ', v_id_column, ', ''', v_column_name, ''', ', v_column_name, ' ',
                            'FROM ', v_entity_name, ' ',
                            'WHERE ', v_column_name, ' LIKE ?'
                        );

                        PREPARE stmt FROM @sql;
                        EXECUTE stmt USING @search_pattern;
                        DEALLOCATE PREPARE stmt;
                    END IF;

                    SET v_column_index = v_column_index + 1;
                END WHILE;
            END IF;

            SET v_entity_index = v_entity_index + 1;
        END WHILE;

        SELECT * FROM t_search_results;
    END IF;
END //
DELIMITER ;
