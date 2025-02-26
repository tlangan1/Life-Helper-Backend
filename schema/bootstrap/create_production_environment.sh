# name: create_production_environment.sh
#
# to execute the script run ./create_production_environment.sh -UnderAWhiteSky1 life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to create
# 3rd Argument (optional): copy_from_production to populate it with the production schema and data.

# ******************************************
# create a dump of the current production database
# including the data.
# ******************************************

mysqldump -u tlangan -p$1 --routines --triggers life_helper > life_helper.dump.sql

# ******************************************
# create the database
# ******************************************

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --file ../databases/create_$2_db.sql

# ******************************************
# load these two helper scripts
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/p_create_table.sql"

../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/p_create_table_schema.sql"

# ******************************************
# load the table creation stored procedures
# ******************************************

../tables/load_table_creation_sps.sh $1 $2

# ******************************************
# load the foreign key stored procedures
# ******************************************

../foreign_keys/load_foreign_keys_sps.sh $1 $2

# ******************************************
# load all the stored procedures for the application
# ******************************************

../stored_procedures/load_stored_procedures.sh $1 $2

# ******************************************
# Load all migration scripts
# ******************************************

../tables/migration_scripts/load_migration_sps.sh $1 $2

# ******************************************
# Execute the schema creation script
# ******************************************
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../tables/helper_scripts/execute_p_create_table_schema.sql

# ******************************************
# load all triggers for the application
# ******************************************

../triggers/load_triggers.sh $1 $2

# ******************************************
# Helper stored procedures not used in the application
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../scripts/p_search_for_dependencies.sql"
