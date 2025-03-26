## Tables

```
Show tables
```

goal
goal_note
goal_task
note
objective
objective_goal
objective_note
sql_error
t_goal
t_goal_note
t_goal_task
t_note
t_objective
t_objective_goal
t_objective_note
t_sql_error
t_task
t_task_note
t_task_user
t_trigger_log
t_user_login
t_web_push_subscription
t_work_log
task
task_note
task_user
trigger_log
user_login
web_push_subscription
work_log

## Stored Procedures

```
SELECT specific_name FROM information_schema.routines
WHERE routine_type = 'PROCEDURE' AND routine_schema = 'life_helper';
```

p_add_goal
p_add_goal_note
p_add_item
p_add_note
p_add_objective
p_add_objective_note
p_add_task
p_add_task_note
p_add_user_login
p_attach_item
p_calculate_worked_time
p_create_goal
p_create_goal_note
p_create_goal_task
p_create_note
p_create_objective
p_create_objective_goal
p_create_objective_note
p_create_sql_error
p_create_table
p_create_table_schema
p_create_task
p_create_task_note
p_create_task_user
p_create_trigger_log
p_create_user_login
p_create_web_push_subscription
p_create_work_log
p_drop_all_foreign_keys
p_get_item
p_get_items
p_get_notes
p_get_user_login
p_handle_db_error
p_migrate_goal
p_migrate_goal_note
p_migrate_goal_task
p_migrate_note
p_migrate_objective
p_migrate_objective_goal
p_migrate_objective_note
p_migrate_sql_error
p_migrate_task
p_migrate_task_note
p_migrate_task_user
p_migrate_trigger_log
p_migrate_user_login
p_migrate_web_push_subscription
p_migrate_work_log
p_search_for_dependencies
p_update_goal
p_update_item
p_update_objective
p_update_task

## Foreign Keys

```
SELECT table_name, constraint_name FROM information_schema.table_constraints
WHERE table_schema = database()
and constraint_type = 'FOREIGN KEY';
```

goal_note fk_goal_note_to_goal
goal_note fk_goal_note_to_note
goal_task fk_goal_task_to_goal
goal_task fk_goal_task_to_task
objective_goal fk_objective_goal_to_goal
objective_goal fk_objective_goal_to_objective
objective_note fk_objective_note_to_note
objective_note fk_objective_note_to_objective
task_note fk_task_note_to_note
task_note fk_task_note_to_task
task_user fk_task_user_to_task
task_user fk_task_user_to_user_login
work_log fk_work_log_to_task
work_log fk_work_log_to_user_login

## Triggers

```
select trigger_schema, trigger_name -- , action_statement
from information_schema.triggers
where trigger_schema = 'life_helper'

OR

show triggers
```

trigger_goal_update
trigger_task_update
