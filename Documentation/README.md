# Life Helper Application

## Diagrams


### Web Push Subscription Process
```mermaid
  graph TD;
      A[<h2>Browser</h2> <br />  Ask the user if they would like web pushes]-- No -->B[Refresh data by calling the server on every action];
      A-- Yes -->C[Register the Service Worker in the browser <br /> and pass the subscription information to the server <br /> so that it can be stored in the database.]
      C-- Post to the endpoint web_push_subscription <br /> with the body containing the subscription information -->D[<h2>Web Server </h2>];
      D--Call stored procedure p_add_item <br /> with item_type = `web_push_subscription` <br /> and data = json version of subscription -->E[<h2>Database</h2>]
```

### Web Push Process
```mermaid
  graph TD;
      A[<h2>Browser</h2> <br />  A user alters data that is time sensitive <br /> for other users such as starting a task.]-- Send data change to web server endpoint -->B[<h2> Web Server </h2>];
      B--Send data change to database -->C[<h2>Database</h2>];
      C--data change successful-->B;
      B-- request push subscriptions from database -->D[<h2>Database</h2>];
      D-- receive push subscriptions from database -->E[<h2> Web Server </h2>];
      E-- For each subscription push update to capability url -->F[<h2>Push Service Used By Browser</h2>];
      F-- Each web push goes to a browser <br /> which is passed to a service worker -->A
```
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

1. [x] For objectives page should be upper case O `Objectives`.
1. [x] For Goals page should be `Goals for [objective name]`.
1. [x] For Tasks page should be `Tasks for [goal name]`.

#### Navigation

1. [x] Provide a way to move up the Objective/Goal/Task stack.

#### More TODOs...

1. [ ] default focus to add text box
2. [ ] Incorporate the service worker into the Life Helper app. Default to asking the user to accept. If they do not provide permission then have the app reload all items on each update, otherwise, use the service worker to keep the data fresh. Note how [Pushpad](https://pushpad.xyz/blog/web-push-error-410-the-push-subscription-has-expired-or-the-user-has-unsubscribed) does it. Soon after you open this page a non-modal dialog appears asking the viewer if they would like to stay informed about Pushpad through notifications. 
3. [ ] Get data from database to drive pushes in the Express Server app.
4. [ ] Remove a web push from the database if a 410 is received from web push service.
5. [x] Change `push_subscription` nomenclature to `web_push_subscription`
6. [ ] Change `notification` nomenclature to `web_push`.
7. [ ] Fold `p_save_push_subscription` into `p_add_items`. 
