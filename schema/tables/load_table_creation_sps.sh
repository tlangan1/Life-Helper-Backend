# name: load_table_creation_sps.sh
#
# to execute the script run ./load_table_creation_sps.sh -UnderAWhiteSky1 [some database name]
# The ./ is important
# 
# 1st Parameter: password
# 2nd Parameter: the schema in which to load the stored procedures

# ******************************************
# load the table creation stored procedures
# ******************************************

search_dir=../tables/
for entry in "$search_dir"*.sql
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done

../scripts/run.sh "tlangan" $1 $2 "../triggers/DEBUG helpers/p_create_trigger_log.sql"
