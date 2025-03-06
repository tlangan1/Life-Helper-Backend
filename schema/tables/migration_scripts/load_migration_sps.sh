# name: load_migration_sps.sh
#
# to execute the script run ./load_migration_sps.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
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

../scripts/run.sh "tlangan" $1 $2 "../tables/migration_scripts/p_migrate_task_user.sql"
