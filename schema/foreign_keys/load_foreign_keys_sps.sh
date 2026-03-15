# name: load_foreign_keys_sps.sh
#
# to execute the script run ./load_foreign_keys_sps.sh <password> <schema>
# to execute the script run ./load_foreign_keys_sps.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
# ******************************************
# load the foreign key stored procedures
# ******************************************

search_dir=../foreign_keys/
for entry in "$search_dir"*.sql
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done
