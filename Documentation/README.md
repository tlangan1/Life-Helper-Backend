# Life Helper Application

## Architecture

1. The back end of the application is composed of an Express web server with endpoints that enable the front end to read from and write data to a MySQL database. This application is located at D:\Computer Science\Original Applications\Express Server.
1. The front end is a SolisJS based web application. This application is located at D:\Computer Science\Original Applications\Life Helper.
1. The documentation and schema for the application are located at D:\Computer Science\Original Applications\Life Helper Docs and Schema.

### Back End
1. Each end point is handled by a branch of code in `server.js`. These endpoints are of the form .../get/[item name], .../add/[item name], .../delete/[item name] and .../update/[item name].
1. Each endpoint maps to a database call in `db.js`. Each database call is handled by a stored procedure in the database.
1. Note that the database deletes are actually just logical deletes where the deleted_dtm column of a given item is updated to the current date time.

### TODOs

#### Page title

- [x] For objectives page should be upper case O `Objectives`.
- [x] For Goals page should be `Goals for [objective name]`.
- [x] For Tasks page should be `Tasks for [goal name]`.

#### Navigation

- [x] Provide a way to move up the Objective/Goal/Task stack.

#### More TODOs...

- [ ] defaut focus to add text box
