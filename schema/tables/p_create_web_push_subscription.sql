-- This entity is a place for stored procedures to persist sql errors
-- If they are coded to use it.


drop procedure if exists p_create_web_push_subscription;

DELIMITER //

create procedure p_create_web_push_subscription()
	BEGIN
	drop table IF EXISTS web_push_subscription;

	create table web_push_subscription (
		web_push_subscription_id int not null auto_increment,
		capability_url varchar(250) not null,
		public_key varchar(100) not null,
		private_key varchar(100) not null,
		subscribed_dtm datetime default current_timestamp not null,
		unsubscribed_or_expired_dtm datetime null,
		PRIMARY KEY (web_push_subscription_id)
	);
    END //

DELIMITER ;