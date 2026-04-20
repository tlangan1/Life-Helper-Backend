# to execute the script run ./run_new_tests.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Exit immediately if any command fails
set -e
set -o pipefail

# Pass the password as the first argument
# Pass the test schema as the second argument

######################################################
# Run the test scripts.
######################################################

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --schema $2 --file tests/run_test_script_5.sql || { echo "Error running run_test_script_5.sql"; exit 1; }
