# to execute the script run ./run_existing_tests.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Exit immediately if any command fails
set -e
set -o pipefail

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Run the test scripts.
######################################################
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/run_test_script_1.sql || { echo "Error running run_test_script_1.sql"; exit 1; }

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/run_test_script_2.sql || { echo "Error running run_test_script_2.sql"; exit 1; }

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/run_test_script_3.sql || { echo "Error running run_test_script_3.sql"; exit 1; }

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/run_test_script_4.sql || { echo "Error running run_test_script_4.sql"; exit 1; }
