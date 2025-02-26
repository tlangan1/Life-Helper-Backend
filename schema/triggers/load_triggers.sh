# name: load_triggers.sh
#
# to execute the script run ./load_triggers.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
# ******************************************
# load all triggers for the application
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../triggers/trigger_goal_update.sql"

../scripts/run.sh "tlangan" $1 $2 "../triggers/trigger_task_update.sql"

