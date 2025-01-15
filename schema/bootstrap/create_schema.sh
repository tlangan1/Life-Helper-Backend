# to execute the script run ./create_schema.sh
# The ./ is important

# Pass the password as the first argument
# Pass the schema as the second argument

# This was just an example of how to run a script
# mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --file ../scripts/show_tables_in_life_helper.sql

# create the database
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --file ../databases/create_life_helper_db.sql

## load these two helper scripts
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/helper_scripts/p_create_table.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/helper_scripts/p_create_table_schema.sql

# load the table creation stored procedures
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_objective.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_objective.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_goal.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_task.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_objective_goal.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_goal_task.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_sql_error.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_web_push_subscription.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_note.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_objective_note.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_goal_note.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/p_create_task_note.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../triggers/DEBUG helpers/p_create_trigger_log.sql'

# load the foreign key stored procedures
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_add_all_foreign_keys.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_drop_all_foreign_keys.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_add_objective_goal_foreign_keys.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_add_goal_task_foreign_keys.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_add_objective_note_foreign_keys.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_add_goal_note_foreign_keys.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../foreign keys/p_add_task_note_foreign_keys.sql'

# load all the stored procedures for the application
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_goal_note.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_goal.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_item.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_note.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_objective_note.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_objective.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_task_note.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_add_task.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_cancel_delete_item.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_get_items.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_get_notes.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_handle_db_error.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_update_item.sql'

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file '../stored procedures/p_attach_item.sql'


# Execute the schema creation script
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/helper_scripts/execute_p_create_table_schema.sql

# Now add the triggers
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../triggers/trigger_goal_update.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../triggers/trigger_task_update.sql

# Helper stored procedures not used in the application
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../scripts/p_search_for_dependencies.sql
