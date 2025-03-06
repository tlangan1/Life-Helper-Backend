# name: create_test_environment.sh
#
# to execute the script run ./create_test_environment.sh -UnderAWhiteSky1 copy_from_production
# The ./ is important
# 
# 1st Argument: password
# 2nd Argument: if "copy_from_production" then populate with production data,
# otherwise create an "empty" schema

./create_environment.sh $1 test_life_helper $2