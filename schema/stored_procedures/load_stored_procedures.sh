# name: load_stored_procedures.sh
#
# to execute the script run ./load_stored_procedures.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
# ******************************************
# load all the stored procedures for the application
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_goal.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_goal_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_objective.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_objective_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_task.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_task_note.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_add_user_login.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_attach_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_cancel_delete_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_get_items.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_get_notes.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_get_user_login.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_handle_db_error.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_update_item.sql"

../scripts/run.sh "tlangan" $1 $2 "../stored_procedures/p_start_task.sql"
