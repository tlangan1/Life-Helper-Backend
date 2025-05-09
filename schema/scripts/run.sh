
# to execute the script run ./run.sh $1 $2 $3

# Pass the password as the first argument
# Pass the user name as the second argument
# Pass the test schema as the second argument
# Pass the file or SQL to run as the third argument

# This script is used to run a single sql script file
# within the context of a wrapper script. It is not
# intended to be used as a standalone script. 

if [ -f "$4" ]; then
    mysqlsh --mysqlx -u "$1" -p"$2" -h localhost -P 33060 --schema "$3" --file "$4"
else
    mysqlsh --mysqlx -u "$1" -p"$2" -h localhost -P 33060 --sql --schema "$3" -e "$4"
fi