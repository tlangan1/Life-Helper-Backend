# to execute the script run ./create-test-environment.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument

# create a test database
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --file recreate_test_db.sql

# Extract the schema from the production database
mysqldump -u tlangan -p$1 --routines --triggers life_helper > life_helper.sql

# Load the production schema into the test database
mysql -u tlangan -p$1 --comments test_life_helper < life_helper.sql
