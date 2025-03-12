# name: create_environment.sh
#
# to execute the script run ./create_environment.sh -UnderAWhiteSky1 test_life_helper copy_from_production
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
# 3rd Argument: if "copy_from_production" then populate with production data,
# otherwise create an "empty" schema

echo "******************************************"
echo "starting create_environment.sh"
echo "******************************************"

# ******************************************
# prevent this script from running in the production environment
# ******************************************
if [ "$2" = "life_helper" ]; then
    echo "You are not allowed to run this script in the production environment"
    exit 1;
fi

# ******************************************
# create the database
# ******************************************
../scripts/run.sh "tlangan" $1 test_life_helper "create database if not exists $2"

if [ "$3" = "copy_from_production" ]; then
    # Extract the schema from the production database
    mysqldump -u tlangan -p$1 --routines --triggers life_helper > life_helper.dump.sql

    # Load the production schema into the test database
    mysql -u tlangan -p$1 --comments $2 < life_helper.dump.sql
fi

# ******************************************
# delete data from any new tables as it
# will be preserved between test runs
# ******************************************

echo "******************************************"
echo "deleting data from any new tables"
echo "******************************************"

search_dir=../tables/new_tables
for entry in "$search_dir"/*
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done

# exit

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
echo " creating the table schema"
echo "******************************************"

if [ "$3" = "copy_from_production" ]; then
    ../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/execute_p_create_table_schema_with_data.sql"
else
    ../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/execute_p_create_table_schema_without_data.sql"
fi

# ******************************************
# load the foreign key stored procedures
# ******************************************

echo "******************************************"
echo " loading foreign key creation SPs"
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
