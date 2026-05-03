# name: load_functions.sh
#
# to execute the script run ./load_functions.sh -UnderAWhiteSky1 test_life_helper
# The ./ is important
#
# Exit immediately if any command fails
set -e
set -o pipefail
# 
# 1st Argument: password
# 2nd Argument: schema to create
#
# ******************************************
# load the functions for the application
# ******************************************

search_dir=../functions/
for entry in "$search_dir"*.sql
do
    ../scripts/run.sh "tlangan" $1 $2 "$entry"
done
