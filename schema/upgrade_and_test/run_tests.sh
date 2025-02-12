# To execute the baseline tests run ./run_tests.sh -UnderAWhiteSky1 test_life_helper do_not_run_new_tests copy_from_production
# To execute any new tests on the schema changes run ./run_tests.sh -UnderAWhiteSky1 test_life_helper new_tests copy_from_production
# The ./ is important

# 1st Argument: password
# 2nd Argument: schema to create
# 3rd Argument: Pass a flag that indicates whether to load the changes or not before running the tests
# 4th Argument : copy_from_production to populate it with the production schema and data otherwise just leave it empty.


./create_environment.sh $1 $2 $4

./load_existing_test_objects.sh $1 $2

./run_existing_tests.sh $1 $2

if [ "$3" != "do_not_run_new_tests" ]; then
    echo "Running new tests"
    ./load_new_test_objects.sh $1 $2
    ./run_new_tests.sh $1 $2
fi

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --result-format=table --schema $2 --file tests/test_results.sql > test_results.txt

echo " "
echo "Test Results"

# awk {print} test_results.txt
awk -f ~/scripts/colors -e '/SUCCESS/ {$0 = BG_GREEN($0)} /FAILURE/ {$0 = BG_RED($0)} {print}' test_results.txt

