# name: upgrade_environment.sh
#
# ******************************************
# The upgrade script is important to retain
# other settings such as users, grants, etc.
# ******************************************
#
# to execute the script run ./upgrade_environment.sh -UnderAWhiteSky1 life_helper
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: schema to upgrade

# ******************************************
# Create a copy of the selected database
# ******************************************
mysqldump -u tlangan -p$1 --routines --triggers $2 > $2.dump.sql

# ******************************************
# Re-create the selected database
# ******************************************
../scripts/run.sh "tlangan" $1 $2 "../databases/create_$2_db.sql"

# ******************************************
# Load the schema from the copy
# ******************************************

mysql -u tlangan -p$1 --comments $2 < $2.dump.sql

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

../scripts/run.sh "tlangan" $1 $2 "../tables/helper_scripts/execute_p_create_table_schema_with_data.sql"

# ******************************************
# load all triggers for the application
# ******************************************

../triggers/load_triggers.sh $1 $2

# ******************************************
# Helper stored procedures not used in the application
# ******************************************

../scripts/run.sh "tlangan" $1 $2 "../scripts/p_search_for_dependencies.sql"
