# name: load_stored_procedures.sh
#
# to execute the script run ./load_stored_procedures.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
# ******************************************
# load the stored procedures for the application
# ******************************************

search_dir=../stored_procedures/
for entry in "$search_dir"*.sql
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done
