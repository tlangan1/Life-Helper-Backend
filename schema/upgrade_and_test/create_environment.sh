# to execute the script run ./create_schema.sh -UnderAWhiteSky1 test_life_helper copy_from_production
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
# 3rd Argument (optional): copy_from_production to populate it with the production schema and data.

# ******************************************
# create the database
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../databases/create_$2_db.sql"

if [ "$3" = "copy_from_production" ]; then
    # Extract the schema from the production database
    mysqldump -u tlangan -p$1 --routines --triggers life_helper > life_helper.dump.sql

    # Load the production schema into the test database
    mysql -u tlangan -p$1 --comments $2 < life_helper.dump.sql
fi

# ******************************************
## load these two helper scripts
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/p_create_table.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/p_create_table_schema.sql"

# ******************************************
# load the table creation stored procedures
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_goal.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_goal_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_goal_task.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_objective.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_objective_goal.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_objective_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_sql_error.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_task.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_task_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../triggers/DEBUG helpers/p_create_trigger_log.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_user_login.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_web_push_subscription.sql"

# ******************************************
# load the foreign key stored procedures
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_all_foreign_keys.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_goal_note_to_goal_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_goal_note_to_note_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_goal_task_to_goal_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_goal_task_to_task_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_objective_goal_to_goal_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_objective_goal_to_objective_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_objective_note_to_note_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_objective_note_to_objective_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_task_note_to_note_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_add_task_note_to_task_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign keys/p_drop_all_foreign_keys.sql"

# ******************************************
# load all the stored procedures for the application
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_goal.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_goal_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_objective.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_objective_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_task.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_task_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_add_user_login.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_attach_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_cancel_delete_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_get_items.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_get_notes.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_get_user_login.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_handle_db_error.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored procedures/p_update_item.sql"

# ******************************************
# Load all migration scripts
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_goal.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_goal_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_goal_task.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_objective.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_objective_goal.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_objective_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_sql_error.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_task.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_task_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_trigger_log.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_user_login.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_web_push_subscription.sql"

# ******************************************
# Execute the schema creation script
# ******************************************

if [ "$3" = "copy_from_production" ]; then
    ../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/execute_p_create_table_schema_with_data.sql"
else
    ../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/execute_p_create_table_schema_without_data.sql"
fi

# ******************************************
# Now add the triggers
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../triggers/trigger_goal_update.sql"

../scripts/run.sh "tlangan" $1 $2 "../triggers/trigger_task_update.sql"

# ******************************************
# Helper stored procedures not used in the application
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../scripts/p_search_for_dependencies.sql"
