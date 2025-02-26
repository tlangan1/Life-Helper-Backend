# name: load_table_creation_sps.sh
#
# to execute the script run ./load_table_creation_sps.sh -UnderAWhiteSky1 [some database name]
# The ./ is important
# 
# 1st Parameter: password
# 2nd Parameter: the schema in which to load the stored procedures

# load the table creation stored procedures

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

../scripts/run.sh "tlangan" $1 $2 "../tables/p_create_task_user.sql"

