# to execute the script run ./run-existing-tests.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Run the test scripts.
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file run_test_script_1.sql

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file run_test_script_2.sql

