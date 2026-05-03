## Solution

- Get it working in p_get_items
- Change p_calculate_worked_time to p_calculate_working_status_today

## Current Code

### p_get_items

    - This has not been implemented...this is where I am in my thoughts now.  I not to bundle concept so it can be consumed in the other locations.
    ```
    WHEN "daily_working_status" THEN
        SET @user_working = f_is_user_working(@user_login_id);
        SET @data = JSON_OBJECT("start_dtm", curdate(), "end_dtm", date_add(curdate(), INTERVAL 1 day), "user_login_id", @user_login_id);
        call p_calculate_worked_time(@data, @elapsed_work_time);
        select @user_working as user_working, @elapsed_work_time as elapsed_work_time;
    ```

### p_get_user_login

    - This is currently in use and working
    ```
    Set @user_name = JSON_UNQUOTE(JSON_EXTRACT(data, '$.user_name'));
    Set @user_working = false;
    Set @elapsed_work_time = 0;
    select user_login_id into @user_login_id from user_login where user_name = @user_name;

    IF @user_login_id Is Not Null THEN
    	SET @user_working = f_is_user_working(@user_login_id);
    	SET @data = JSON_OBJECT("start_dtm", curdate(), "end_dtm", date_add(curdate(), INTERVAL 1 day), "user_login_id", @user_login_id);
        call p_calculate_worked_time(@data, @elapsed_work_time);
    END IF;

    select ul.*, @user_working as user_working, @elapsed_work_time as elapsed_work_time from user_login ul where user_name = @user_name;
    ```

### p_update_task

    - This is currently in use and working
    ```
    SET @user_working = f_is_user_working(@user_login_id);
    SET @data = JSON_OBJECT("start_dtm", curdate(), "end_dtm", date_add(curdate(), INTERVAL 1 day), "user_login_id", @user_login_id);
    call p_calculate_worked_time(@data, @elapsed_work_time);
    select @user_working as user_working, @elapsed_work_time as elapsed_work_time;
    ```
