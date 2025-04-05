DROP PROCEDURE IF exists p_get_thoughts;

DELIMITER //
CREATE PROCEDURE p_get_thoughts(IN data JSON)
BEGIN
	select * from thought where user_login_id = JSON_EXTRACT(data, '$.user_login_id')
    and deleted_dtm Is Null order by order_id desc;
END //
DELIMITER ;
