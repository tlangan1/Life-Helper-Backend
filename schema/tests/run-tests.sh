# To execute the baseline tests run ./run-tests.sh -UnderAWhiteSky1 test_life_helper
# To execute the tests on the schema changes run ./run-tests.sh -UnderAWhiteSky1 test_life_helper load_changes
# The ./ is important

# Pass the password as the first argument
# Pass the test schema as the second argument
# Pass a flag that indicates whether to load the changes or not before running the tests

./create-test-environment.sh $1 $2


if [ "$3" = "load_changes" ]; then
    ./load-schema-changes.sh $1 $2
fi

./load-existing-test-objects.sh $1 $2

./run-existing-tests.sh $1 $2

if [ "$3" = "load_changes" ]; then
    ./load-new-test-objects.sh $1 $2 undo
    ./run-new-tests.sh $1 $2 undo
fi

mysqlsh --mysqlx -u tlangan -p$1 -h localhost -P 33060 --result-format=table --schema $2 --file test_results.sql > test_results.txt

echo " "
echo "Test Results"

# awk {print} test_results.txt
awk -f ~/scripts/colors -e '/SUCCESS/ {$0 = BG_GREEN($0)} /FAILURE/ {$0 = BG_RED($0)} {print}' test_results.txt

