DROP PROCEDURE IF exists p_calculate_worked_time;

DELIMITER //
CREATE PROCEDURE p_calculate_worked_time(IN data JSON, OUT total_elapsed_work_time float)
BEGIN
	-- These parameters are required
    Set @start_dtm = JSON_UNQUOTE(JSON_EXTRACT(data, '$.start_dtm'));
    Set @end_dtm = JSON_UNQUOTE(JSON_EXTRACT(data, '$.end_dtm'));

	-- This parameter is optional
	Set @user_login_id = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_login_id'));

	-- Get a list of work_log records whose started_work_dtm and stopped_work_dtm
    -- overlap the time frame defined by @start_dtm and @end_dtm.
    drop table if exists relevant_work_log_rows;
    
    create temporary table relevant_work_log_rows SELECT user_login_id, started_work_dtm, Ifnull(stopped_work_dtm, now()) as stopped_work_dtm
	FROM work_log
	where started_work_dtm < @end_dtm
	and Ifnull(stopped_work_dtm, now()) > @start_dtm
    and user_login_id = IFNULL(@user_login_id, user_login_id);



-- IFNULL(sum(timestampdiff(second, @start_dtm, stopped_work_dtm ))/60/60, 0) as case_1_total

    drop table if exists case_1_rows;
	    
    create temporary table case_1_rows select user_login_id
    , timestampdiff(second, @start_dtm, stopped_work_dtm ) as elapsed_work_time
    from relevant_work_log_rows
	where started_work_dtm < @start_dtm
	and stopped_work_dtm <= @end_dtm;
    
    drop table if exists case_2_rows;
	    
	create temporary table case_2_rows select user_login_id
    , timestampdiff(second, started_work_dtm, @end_dtm) as elapsed_work_time
    from relevant_work_log_rows
	where started_work_dtm >= @start_dtm
	and stopped_work_dtm > @end_dtm;
    
   	drop table if exists case_3_rows;
	    
	create temporary table case_3_rows select user_login_id
    , timestampdiff(second, started_work_dtm, stopped_work_dtm) as elapsed_work_time
    from relevant_work_log_rows
	where started_work_dtm >= @start_dtm
	and stopped_work_dtm <= @end_dtm;

	drop table if exists all_rows;
	create temporary table all_rows select * from case_1_rows union select * from case_2_rows union select * from case_3_rows;

	-- select sum(elapsed_work_time)/60/60 into elapsed_work_time from all_rows;
	-- group by user_login_id;
    
    -- set elapsed_work_time = 10;
    select sum(elapsed_work_time)/60/60 into total_elapsed_work_time from all_rows group by user_login_id;

	IF total_elapsed_work_time Is NUll THEN
		set total_elapsed_work_time = 0;
	END IF;
    
-- 	select user_login_id, sum(elapsed_work_time)/60/60 as total_elapsed_work_time from all_rows
-- 	group by user_login_id;
END //
DELIMITER ;
