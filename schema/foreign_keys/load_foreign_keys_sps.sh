# name: load_foreign_keys_sps.sh
#
# to execute the script run ./load_foreign_keys_sps.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
# ******************************************
# load the foreign key stored procedures
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_all_foreign_keys.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_goal_note_to_goal_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_goal_note_to_note_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_goal_task_to_goal_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_goal_task_to_task_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_objective_goal_to_goal_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_objective_goal_to_objective_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_objective_note_to_note_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_objective_note_to_objective_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_task_note_to_note_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_add_task_note_to_task_fk.sql"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_drop_all_foreign_keys.sql"

