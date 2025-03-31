DROP PROCEDURE IF exists p_add_thought;

DELIMITER //
CREATE PROCEDURE p_add_thought(IN data JSON)
	BEGIN
		select max(order_id) + 1 into @order_id from thought;
        
        if @order_id Is Null THEN
			set @order_id = 1;
        END IF;
        
		insert into thought (thought, order_id) values (JSON_UNQUOTE(JSON_EXTRACT(data, '$.thought_text')), @order_id);
	END //

DELIMITER ;
