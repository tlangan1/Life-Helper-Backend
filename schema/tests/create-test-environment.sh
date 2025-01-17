# to execute the script run ./create-test-environment.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

# create a test database
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --file recreate_test_db.sql

# Extract the schema from the production database
mysqldump -u tlangan -p$1 --routines --triggers life_helper > D:\\life_helper.sql

# Load the production schema into the test database
mysql -u tlangan -p$1 --comments test_life_helper < D:\\life_helper.sql

######################################################
# Make the changes to the schema that are to be tested
######################################################
#mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../triggers/trigger_goal_update.sql

#ysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file ../triggers/trigger_task_update.sql

######################################################
# Load the test scripts and tables
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file p_task_and_goal_trigger_test_1.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file p_task_and_goal_trigger_test_2.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file table_test_results.sql
######################################################
# Run the test script. You should only run one test script at a time
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file run_test_script_1.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file run_test_script_2.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --result-format=table --schema $2 --file test_results.sql > test_results.txt

echo " "
echo "Test Results"

# awk {print} test_results.txt
awk -f ~/scripts/colors -e '/SUCCESS/ {$0 = BG_GREEN($0)} /FAILURE/ {$0 = BG_RED($0)} {print}' test_results.txt
