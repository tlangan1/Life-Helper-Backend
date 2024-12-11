## TODOs

### Completed TODOs

- [x] Determine if the <!--- cspell:disable --> `pushsubscriptionchange` event
      is fired when the user unregisters <!--- cspell:enable --> the web push notification. IT DOES NOT.
- [x] For objectives page should be upper case O `Objectives`.
- [x] For Goals page should be `Goals for [objective name]`.
- [x] For Tasks page should be `Tasks for [goal name]`.
- [x] Provide a way to move up the Objective/Goal/Task stack.
- [x] Incorporate the service worker into the Life Helper app.
- [x] Send a web push notification from the Express Server app when a task is added.
- [x] Set web push subscription expired_dtm column to the current datetime if a 410 is received from the web push service.
- [x] Change `push_subscription` nomenclature to `web_push_subscription`
- [x] Change `notification` nomenclature to `web_push`.
- [x] Fold `p_save_push_subscription` into `p_add_items`.
- [x] default focus to add text box
- [x] Remove delete_type from object passed to deleteItem in sendWebPush error branch.
- [x] Replace unsubscribed_dtm and expired_dtm columns in web_push_subscription with a single column called unsubscribed_or_expired_dtm.
- [x] Alter p_delete_item to reflect this change.
- [x] Do not push to subscriptions which are no longer valid.
- [x] Only web push when an item is added or started.
- [x] Remove the Un-register button from the final version of the application.
- [x] Finish the `Switch between previously used networks` and `Configure for a new Network` portions of this document at the bottom.
- [x] Implement a strategy to discover/distribute the IP address to use across the three pieces of the application, the app itself, the express server and the service worker so that no configuration is necessary to switch between previously configured networks.

  - [x] Application: Discover the domain from window.location at startup.
  - [x] When a service worker is activated obtain the correct domain to use for the Express server from event.target.registration.scope.
  - [x] Express Server: Name the security certificate files the same as the hostname so that the express server knows which one to use at startup.
  - [x] Express Server: Only support the "Wi-Fi" address but retain a copy of the code that addresses CORS. Note, since the web server and the express server are on the same domain there should be NO CORS ISSUE. TEST THIS!!!
  - [x] When I get home see if I have a seamless transition from David's home network to mine. If not, rectify any issues.
  - [x] Finally, modify the`Switch between previously used networks` and `Configure for a new Network` portions of this document to reflect this new reality.

- [x] Replace the item text box with an "Add [a/an] [Objective/Goal/Task]" label/link". Focus no longer makes sense. See the "Add a comment" link [here](https://ux.stackexchange.com/questions/149929/text-box-max-character-limit-best-practice) as well as the question and associated answer. Create a modal solution which provides the user with two input controls. One to enter the item label and one to enter the item description. See the docs for the [Portal component](https://docs.solidjs.com/reference/components/portal#lessportalgreater). Make this a component and call it AddItem.
  - [x] Before proceeding change objective-goal-task.jsx to ProjectItem.jsx and change the component name from ItemFromImport to ProjectItem.
  - [x] Before proceeding stop prop drilling dataServer. Instead, use the GlobalState component wherever needed.
  - [x] Before proceeding put the refreshData and setRefreshData in the GlobalState component.
  - [x] Use the `data-` preface when adding any attributes to an html element.
  - [x] Do not use the event object in the function affectItem to obtain the values to be passed to the database. Instead, pass an object called `data` as a parameter. Note that this change affects this component, AddItem, and also affects the ProjectItem component.
    - [x] Implement `add` in AddItem component
    - [x] Change `start` and `delete` in ProjectItem component.
- [x] Push this version to Github
- [x] Put the project in the "Github Page Data Access Test" folder on Github and test the Github page generated. I have determined that MongoDB can serve as an online database with which to host the application on Github Pages. See [this](https://www.mongodb.com/docs/atlas/app-services/data-api/authenticate/#std-label-data-api-bearer-authentication) for a detailed explanation of the use of the "Bearer" Authentication header to enable CORS requests to MongoDB. This type of authentication is known as JSON Web Tokens or just JWT as explained [here](https://jwt.io/introduction/).
- [x] Obfuscate the user access token and the use of the refresh access token request to re-enable the user access token. See if this passes muster in Github/Github pages.
- [x] Get rid of all the node modules folders. They can be replaced with the `npm ci` command when needed.
- [x] Convert the `AWS RDS database creation 9-25-2024` to a markdown file.

### Currently Being Implemented TODOs

- [ ] Render the completed TODOs as a requirements document
- [ ] Create a list of `Yet To Be Implemented TODOs` to create the minimal version of the application to demonstrate mastery of the the PWA & Caching as well as Push.

### Yet To Be Implemented TODOs

- [ ] `DO THIS LOCALLY AND THEN TEST ON THE AWS RDS INSTANCE`: Reengineer the table creation scripts to avoid placing archiving and foreign key creation code in the individual table scripts. These scripts should create the table structure and nothing else. Create a wrapper schema change script, or possibly stored procedure, that first archives the data by calling `scripts/remove_data.sql` and the calls the appropriate DDL scripts
- [ ] Express Server is sending pushes twice...it should only do a push once.
- [ ] Log service worker changes and retiring previous service worker DB rows. Perhaps I should create a new entity web_push_subscription_version which maintains a history of service workers that all use the same capability url.s
- [ ] I should create a route using solidJS to give the appearance that the service worker file is at the root and move it to a more logical place in the file system. See <a href="#service-worker-in-root">item number 1</a> above
- [ ] All the data required by the interface should be cached. The service worker should update the cache when a push is received. Pushes should be restricted to time sensitive data changes like the starting of a task. If a user goes offline they should not be allowed to start a new task. If this were allowed then it could be the case that several users start the same task which should not be allowed.
- [ ] See the "Add a comment" link [here](https://ux.stackexchange.com/questions/149929/text-box-max-character-limit-best-practice) as well as the question and associated answer for design considerations concerning limitations on the length of text entry.
- [ ] Create a modal solution which provides the user with two input controls. One to enter the item label and one to enter the item description. See the docs for the SolidJS [Portal component](https://docs.solidjs.com/reference/components/portal#lessportalgreater).
- [ ] Enforce the correct lengths for the name and description inputs on the AddItem component. There are CSS capabilities that can translate the min_length, max_length, etc. attributes into user feedback. This in combination with some JavaScript, see updateCharacterCount in AddItem.jsx will be sufficient. Note that the JavaScript should be triggered on "key up" or something other than change.
- [ ] Escape quotes in strings when inserting or updating data.
- [ ] Complete "Testing" section of this document
- [ ] Make Life Helper my signature app. The one that `boldly goes where only a few hundred million have gone before.`
- [ ] Consider changing its name to multi-user task management PWA app leveraging push technology for time sensitive updates.
- [ ] Write code to handle <!--- cspell:disable --> pushsubscriptionchange <!--- cspell:enable --> event in service worker. I
      can test this by making the expiration date just a few minutes in the future.
- [ ] When a service worker is un-registered it should be marked as such by setting the “unregistered_dtm” column value to the current datetime. Test this by using the application to unregister the service worker.
- [ ] Use <!--- cspell:disable --> [Pushpad](https://pushpad.xyz/blog/web-push-error-410-the-push-subscription-has-expired-or-the-user-has-unsubscribed) as an example of how to engineer the service worker experience. Soon after you open this page a non-modal dialog appears asking the viewer if they would like to stay informed about Pushpad through notifications. Note, I placed the pushpad.js file, the file that appears to wrap all this functionaity, in the same directory as this document. See the code I added to index.js async function requestNotificationPermission() to see if I can customize the notification permission request message when I create a new subscription. <!--- cspell:enable -->
- [ ] Engineer the experience of the broader application if the user `does not` accept push notifications.
- [ ] Engineer the experience of the broader application if the user `does` accept push notifications.
- [ ] When the application receives a web push notification about a task being added it should respond by adding the task to the cache or other persistent storage such as indexed database, etc. See the [Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Storage_API) for information about the options.
- [ ] Get rid of the unused CSS in index.css borrowed from MDN.
- [ ] Look at Github repos <!--- cspell:disable --> “sw-precache” <!--- cspell:enable --> and “offline-plugin”. See this for the links and other info.
      v
- [ ] Create some kind of search capability
- [ ] Add `Tags` to the items.
- [ ] The service worker may need to put the IP address of the back end server in persistent storage. I have not really thought this through yet but it seems there may be scenarios where the front end is not open but the service worker is awakened by, for example, a web push and me need to interact with the database...I have no idea if this is really a requirement.
- Multi-user considerations
  - [ ] Prevent two users from starting the same task.
  - [ ] When working offline, do not allow a user to start a task but do allow them to work on it and complete it.
  - [ ]
- Log DBErrors in Express App for all routes...currently it is just enabled for `Add` routes.

### Future

- [ ] Move Life Helper to AWS
  - [ ] Implement the Life Helper schema in AWS [RDB](https://us-east-1.console.aws.amazon.com/rds/home?region=us-east-1).
    - [ ] Document the creation of this database in the AWS folder in a subfolder called `RDS database creation 9-25-2024`.
    - [ ] Use [this](https://duckduckgo.com/?q=how+to+use+AWS+secrets+for+a+RDS+database+call+from+an+S3+application&iax=videos&ia=videos&iai=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DNg_zi11N4_c) as a guide.
