
# to execute the script run ./run.sh $1 $2 $3

# Pass the password as the first argument
# Pass the user name as the second argument
# Pass the test schema as the second argument
# Pass the file or SQL to run as the third argument

# This script is used to run a single sql script file
# within the context of a wrapper script. It is not
# intended to be used as a standalone script. 

echo "$4"

if [ -f "$4" ]; then
    mysql -u "$1" -p"$2" "$3" < "$4"
else
    mysql -u "$1" -p"$2" "$3" -e "$4"
fi