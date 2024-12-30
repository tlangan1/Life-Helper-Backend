drop procedure if exists p_create_table_schema;

DELIMITER //

create procedure p_create_table_schema(IN preserve_data bool)
	BEGIN
    call p_drop_all_foreign_keys();
    call p_create_table('objective_goal', preserve_data);
    call p_create_table('goal_task', preserve_data);
    call p_create_table('objective_note', preserve_data);
    call p_create_table('goal_note', preserve_data);
    call p_create_table('task_note', preserve_data);

    call p_create_table('web_push_subscription', preserve_data);
    call p_create_table('sql_error', preserve_data);
    call p_create_table('objective', preserve_data);
    call p_create_table('goal', preserve_data);
    call p_create_table('task', preserve_data);
    call p_create_table('note', preserve_data);

    call p_create_table('trigger_log', preserve_data);

    call p_add_all_foreign_keys();
    END //

DELIMITER ;