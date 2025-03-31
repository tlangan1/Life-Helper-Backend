DROP PROCEDURE IF exists p_get_thoughts;

DELIMITER //
CREATE PROCEDURE p_get_thoughts(IN data JSON)
BEGIN
	select * from thought order by order_id desc;
END //
DELIMITER ;
