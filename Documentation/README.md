<h1 align="center">Life Helper Application</h1s>

## Table of contents

- [Table of contents](#table-of-contents)
- [Issues](#issues)
- [Diagrams](#diagrams)
  - [Web Push Subscription Process](#web-push-subscription-process)
  - [Web Push Process](#web-push-process)
- [Architecture](#architecture)
  - [Back End](#back-end)
  - [Database](#database)
  - [Root CA Management](#root-ca-management)
  - [Configure an environment](#configure-an-environment)
  - [Future AWS Implementation](#future-aws-implementation)
- [Personal Notes](#personal-notes)

## Issues

- Line feeds in text areas such as the item description cause `ER_INVALID_JSON_TEXT_IN_PARAM: Invalid JSON text..."Invalid encoding in string." at position...`. I may want to handle the insertion and update of this type of value outside the JSON structure or just remove each line feed and replace it with a space.

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

- The back end of the application is composed of an ExpressJS web server and a MySQL database server. For local development purposes they run on the same machine. The ExpressJS server provides https routes that the front end running in the browser can use to read from and write data from and to the database.
- The front end web server is a SolisJS based web application running on a Vite server.

### Back End

- Each data end point is handled by a branch of code in `server.js`. These endpoints are of the form .../get/[item name], .../add/[item name], .../delete/[item name] and .../update/[item name].
- Each data endpoint maps to a database call in `db.js`. Each database call is handled by a stored procedure in the database.
- Note that the database deletes are actually just logical deletes where the deleted_dtm column of a given item is updated to the current date time.

### Database

- `MySQL will create and index when a foreign key is created if it deems that that foreign key is not properly supported giving the existing indexes.` For example, consider the entity object_goal where the primary key/index is on object_id, goal_id. When I create the foreign key to objective MySQL does not create an index as the primary is already first indexed on object_id; however, when I create the foreign key to goal, MySQL creates a non-unique index on goal_id to assist in that relationship.
  - I created a stored procedure to remove the foreign keys called `p_drop_all_foreign_keys.sql`. I think this is a tool I may need to use when doing database upgrades but wanting to retain existing data.
  - I created an analog for the indexes but I do not think it will be used. I did it as an exercise. The stored procedure is called `p_drop_all_non_primary_indexes`
- `Logging SQL Errors:` There is an entity called sql_error which initially is being used by p_drop_index to persist sql errors.
  - All stored procedures should contain an error handler that captures all exceptions. This is the syntax for that:
    ```
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
        ...
        rollback; /* If there is a transaction involved */
        insert into sql_error...
        END
    ```
    This design should ensure that no database errors are returned to the application.
  - In the event that a database error occurs the Express server should return a `soft` message to the application indicating that something went wrong and that the user should try the operation again and that if it still fails, register a complaint.
- [This](https://stackoverflow.com/questions/11321491/when-to-use-single-quotes-double-quotes-and-backticks-in-mysql) was very helpful with quoting in MySQL. It included references to single quotes, double quotes and back ticks.

### Root CA Management

- I created a root CA certificates for both the windows machine and the linux machine using `mkcert` using the following command:
  ```
  mkcert install
  ```
  mkcert makes every effort to put this certificate where it needs to go on the machine on which it was created but you may need to manually import it into a browser, import it into a credentials manager (windows) or place it in the file system (linux) in a special location if that does not happen.
- The relevant file is the one that begins "-----BEGIN CERTIFICATE-----".
- If you want to access the front end web server from another device then you need to manually distribute it to that device.
  - In the case of a laptop you can just import it into the browser you want to use. Just rename the file to the correct extension for the given browser. For example, to install the root CA certificate from the linux machine into chrome on the windows machine do the following:
    - Rename it so that it has a .CRT extension.
    - Open settings and go to Privacy and security --> Security --> Manage certificates --> Local certificates and then clicked "Manage imported certificates from Windows". Click "Import" and then "Next" and browse to the file and imported it.
  - In the case of an android phone do the following:
    - Rename it to a .PEM or .CRT file...I think Android accepts both.
    - Bluetooth the certificate to the phone.
    - Go to Settings --> Security and privacy --> More security settings --> Install from phone storage --> CA certificate and click the `Install Anyway` button. Enter a PIN if necessary and then click the "Downloads" folder and select the certificate file.
- If the front end web server is running on the linux machine the SSL certificate that Vite will present will reference the root CA certificate created on that machine. Likewise, if the front end web server is running on the windows machine the SSL certificate that Vite will present will reference the root CA certificate created on that machine.

### Configure an environment

- This configuration assumes there is no DNS resolution.
- Launch the Express Server on some machine and note the "Wi Fi" IP address and the port to which it is listening. This is the address to put in GlobalStateProvider.jsx of the front end web server. This tells the front end where the data can be accessed.
- Launch the front end web server on some machine, perhaps the same machine and note the "Wi Fi" IP address and the port to which it is listening. This is the address to put in the "web_server_url" node in the config.json file on the Express Server. This tells the backend what CORS is allowed.
- If the router assigns an address to the Express Server which is not covered by one of the existing certificates in the cert subdirectory then you will need to create a new on using mkcert. To do so use the following command:
  ```
  mkcert [some IP address like 123.456.7891]
  ```
  Now make sure the files have the same name as the IP address, in this case 123.456.7891 and put them in the cert folder.
- Service worker:
  - The IP address and port to which the Express server is listening on is provided to the service worker by the client, the web page, when needed. The only purpose the service worker currently has for this information is to log a web push subscription in the database. When the client, the web page, requests the service worker to do this it does so in a message that contains the relevant IP address and port.
  - The last time I tried to exercise the service worker the "Sites can ask to send notifications" option was deselected and the option "Collapse unwanted requests (recommended)" as selected. This causes any request to send notifications to be immediately blocked. To fix this problem I selected the "Sites can ask to send notifications" option and the "Expand all requests" option. Image shown below.
    ![alt text](image.png)

### Future AWS Implementation

- I am considering [this](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html) AWS cloud based database solution.
- [Here](https://medium.com/@t.unamka/connecting-to-an-rds-or-aurora-instance-in-a-private-subnet-using-a-jump-box-bastion-host-ba6201464b73) is a link that provides some relevant information concerning the AWS architecture.

## Personal Notes

- On the windows machine the 2 Virtual Ethernet Adapter IP addresses are used by the operating system to allow network access for the VMs. The "Wi Fi" address is the one that the application will use.
- Use the command `arp -a` to view all devices on the local network.
- Regex find and replace in VSCode
  - I used the find pattern `[0-9]+\.` in conjunction with the replace pattern `- [ ]` to replace this
    ````
    1. lorem ipsum
    2. Tom Langan
    3. Another list item
    ```
    with this
    ```
    - [ ] lorem ipsum
    - [ ] Tom Langan
    - [ ] Another list item
    ```
    ````
  - I used the find pattern `<a href=.+?>(\w\*)</a>` in conjunction with the replace pattern `$1` to replace this
    ```
    <li><a href="index.php">Home</a></li>
    <li><a href="about.php">About</a></li>
    <li><a href="contact.php">Contact</a></li>
    ```
    with this
    ```
    <li>Home</li>
    <li>About</li>
    <li>Contact</li>
    ```
- The expiration date on web push subscriptions is determined by the subscription service.
- [This](https://curlconverter.com/javascript/) is a great resource to convert curl commands to fetch API in JavaScript.
- The [W3C Markup Validator](https://validator.w3.org/#validate_by_input) is a very useful tool.
- [This](https://www.dell.com/community/en/conversations/xps/xps-15-7590-no-number-lock-key-for-special-characters/647f880af4ccf8a8de758f81) resource provides some guidance on using the hidden keyboard on my laptop
