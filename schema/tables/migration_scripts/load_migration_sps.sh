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

search_dir=../tables/migration_scripts/
for entry in "$search_dir"*.sql
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done
