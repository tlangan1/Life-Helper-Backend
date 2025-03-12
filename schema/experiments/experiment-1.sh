# name: experiment-1.sh
# use: ./experiment-1.sh <table_name>
# or
# use: ./experiment-1.sh <database_name>

# ../scripts/run.sh tlangan -UnderAWhiteSky1 test_life_helper "./experiment-1.sql"
# ../scripts/run-new.sh "tlangan" -UnderAWhiteSky1 test_life_helper "select * from $1"
../scripts/run.sh "tlangan" -UnderAWhiteSky1 test_life_helper "create database if not exists $1"

