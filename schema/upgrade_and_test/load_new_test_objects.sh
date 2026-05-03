# to execute the script run ./load_new_test_objects.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Exit immediately if any command fails
set -e
set -o pipefail

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Load the test scripts and tables
######################################################

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_4.sql || { echo "Error loading p_task_and_goal_trigger_test_4.sql"; exit 1; }
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_get_user_working_status_today_test_1.sql || { echo "Error loading p_get_user_working_status_today_test_1.sql"; exit 1; }
