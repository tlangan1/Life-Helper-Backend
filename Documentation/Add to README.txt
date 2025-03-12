***********************************************
* This is an attempt to set the default mode of
* mysqlsh to sql instead of js as it is now.
* However, this did not work.
***********************************************

I put mysqlshrc.json in this folder C:\Users\tomla\AppData\Roaming\MySQL\mysqlsh
and its contents were 
{
  "defaultMode": "sql"
}

but it did not work.

***********************************************
* This is the way to associate credentials with
* a logged in user so that they can be passed
* by default to mysqlsh. This will have the side
* effect of suppressing the "using a password
* on a command line" messages in the scripts.
***********************************************

To obfuscate the credentials used to connect us the mysql_config_editor program.