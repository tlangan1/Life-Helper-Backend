drop procedure if exists p_migrate_web_push_subscription;

DELIMITER //

create procedure p_migrate_web_push_subscription()
	BEGIN
    insert into web_push_subscription select web_push_subscription_id,
        '192.168.1.10:3000',
		capability_url,
		public_key,
		private_key,
		subscribed_dtm,
		unsubscribed_or_expired_dtm
 from t_web_push_subscription;
    END //

DELIMITER ;