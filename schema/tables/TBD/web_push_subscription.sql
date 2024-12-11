-- Each time a user agrees to accept web pushes from the server a new row will be
-- inserted into this table. That is, in a multi-user environment there will be
-- one row per user per push notification subscription.

drop table if exists t_web_push_subscription;

create table t_web_push_subscription as select * from web_push_subscription;

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

-- Note, this code is unique to the exact change being implemented.
insert into web_push_subscription select web_push_subscription_id
	, capability_url
    , public_key
    , private_key
    , subscribed_dtm
    , Null
from t_web_push_subscription;