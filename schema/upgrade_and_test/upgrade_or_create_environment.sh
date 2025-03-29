# name: upgrade_or_create_environment.sh
#
# Use: ./upgrade_or_create_environment.sh <password> <schema>
# Example: ./upgrade_or_create_environment.sh -UnderAWhiteSky1 test_life_helper
# 
# 1st Argument: password
# 2nd Argument: schema to upgrade

echo "******************************************"
echo "starting upgrade_or_create_environment.sh"
echo "******************************************"

# ******************************************
# Backup the selected database
# ******************************************

mysqldump -u tlangan -p$1 --routines --triggers "life_helper" > "dumps/life_helper.dump $timestamp.sql"

if [ "$2" != "life_helper" ]; then
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    mysqldump -u tlangan -p$1 --routines --triggers $2 > "dumps/$2.dump $timestamp.sql"
    ../scripts/run.sh "tlangan" $1 "life_helper" "drop database $2;"
    ../scripts/run.sh "tlangan" $1 "life_helper" "create database $2;"
    # ******************************************
    # Load the schema from the copy
    # ******************************************
    mysql -u tlangan -p$1 --comments $2 < "dumps/life_helper.dump $timestamp.sql"
fi

# ******************************************
# load these two helper scripts
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/p_create_table.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/p_create_table_schema.sql"

# ******************************************
# load the table creation stored procedures
# ******************************************

echo "******************************************"
echo " loading table creation SPs"
echo "******************************************"

../tables/load_table_creation_sps.sh $1 $2

# ******************************************
# load all the stored procedures for the application
# ******************************************

echo "******************************************"
echo " loading stored procedures"
echo "******************************************"

../stored_procedures/load_stored_procedures.sh $1 $2

# ******************************************
# Load all migration scripts
# ******************************************

echo "******************************************"
echo " loading table migration SPs"
echo "******************************************"

../tables/migration_scripts/load_migration_sps.sh $1 $2

# ******************************************
# Execute the schema creation script
# ******************************************

echo "******************************************"
echo " creating the table schema and the drop foreign keys sps"
echo "******************************************"

../scripts/run.sh "tlangan" $1 $2 "../foreign_keys/p_drop_all_foreign_keys.sql"
../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/execute_p_create_table_schema_with_data.sql"

# ******************************************
# load the foreign keys
# ******************************************

echo "******************************************"
echo " loading foreign keys"
echo "******************************************"

../foreign_keys/load_foreign_keys_sps.sh $1 $2

# ******************************************
# load all triggers for the application
# ******************************************

echo "******************************************"
echo " loading the triggers"
echo "******************************************"

../triggers/load_triggers.sh $1 $2

# ******************************************
# Helper stored procedures not used in the application
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../scripts/p_search_for_dependencies.sql"
