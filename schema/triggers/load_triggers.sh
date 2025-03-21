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

search_dir=../triggers/
for entry in "$search_dir"*.sql
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done

