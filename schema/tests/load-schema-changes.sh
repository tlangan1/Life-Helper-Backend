# to execute the script run ./load-schema-changes.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

echo "loading schema changes"

######################################################
# Make the changes to the schema that are to be tested
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../upgrade/tables/p_create_user_login.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../upgrade/tables/helper_scripts/create_user_login.sql
