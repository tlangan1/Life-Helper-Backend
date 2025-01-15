# to execute the script run ./create-test-environment.sh -UnderAWhiteSky1
# The ./ is important

# Pass the password as the first argument

# create the database
mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --file recreate_test_db.sql

mysqldump -u tlangan -p$1 --routines --triggers life_helper > D:\\life_helper.sql

mysql -u tlangan -p$1 test_life_helper < D:\\life_helper.sql