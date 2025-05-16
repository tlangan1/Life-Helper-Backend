# to execute the script run ./load_new_test_objects.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Load the test scripts and tables
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/p_task_and_goal_trigger_test_3.sql
