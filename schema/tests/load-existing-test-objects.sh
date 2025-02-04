# to execute the script run ./load-existing-test-objects.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Recreate the test results table
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file table_test_results.sql

######################################################
# Load the existing test scripts
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file p_task_and_goal_trigger_test_1.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file p_task_and_goal_trigger_test_2.sql

