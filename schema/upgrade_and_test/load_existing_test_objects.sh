# to execute the script run ./load_existing_test_objects.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Exit immediately if any command fails
set -e
set -o pipefail

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Recreate the test results table
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/table_test_results.sql || { echo "Error creating test results table"; exit 1; }

######################################################
# Load the existing test scripts
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_1.sql || { echo "Error loading p_task_and_goal_trigger_test_1.sql"; exit 1; }

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_2.sql || { echo "Error loading p_task_and_goal_trigger_test_2.sql"; exit 1; }

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_calculate_worked_time_test_1.sql || { echo "Error loading p_task_calculate_worked_time_test_1.sql"; exit 1; }

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_3.sql || { echo "Error loading p_task_and_goal_trigger_test_3.sql"; exit 1; }

