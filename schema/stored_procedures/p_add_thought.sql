DROP PROCEDURE IF exists p_add_thought;

DELIMITER //
CREATE PROCEDURE p_add_thought(IN data JSON)
	BEGIN
		select max(order_id) + 1 into @order_id from thought;
        
        if @order_id Is Null THEN
			set @order_id = 1;
        END IF;
        
		insert into thought (user_login_id, thought, order_id) values (JSON_EXTRACT(data, '$.user_login_id'), JSON_UNQUOTE(JSON_EXTRACT(data, '$.thought')), @order_id);
	END //

DELIMITER ;
