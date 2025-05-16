# to execute the script run ./load_existing_test_objects.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Recreate the test results table
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/table_test_results.sql

######################################################
# Load the existing test scripts
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_1.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_2.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_calculate_worked_time_test_1.sql

