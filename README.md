#helper

https://trello.com/b/GA0XRtxT/helper

TimeUp (trouver un meilleur nom pour le produit)
Un réseau social permettant aux utilisateurs de bénéficier les uns des autres pour des services executables en moins d’une heure.

Constraints:
A service must take less than one hour to be executed.
A time coin is a virtual money equivalent to 1 hour of the real time
Every service is worth 1 time-coin.

Case study:
User1 -> Have one time-coin -> Can ask for a service
User2 -> Answer to user1 to execute the service in order to gain a time-coin

Notes:
To ask for a service, an user must have a time-coin.
To have a coin, an user must have offered (at least once) a service (or be one of the 1000 first users of the app)
=> maybe we should offer a coin for every registration, not only for the first 1000 users

Scenario:
From the perspective of User1 (user with time-coin)
The user logs in
The user creates a post (detail of the service / date_time of the service / location of the service)
The user’s post is displayed in the feed
The user see a list of users potentially interested in taking his service
The user can discuss the details of this service with an user offering a service before accepting
before selecting who is going to execute the service.
The user select one of them to execute the service.
The service status is changed to processing
When the time_date of the service is reached, a one hour timer starts

=>we should maybe let the users start the timer (the person who asks the service) in case people are late or they don't start the job exactlyly at the defined hour.

After the timer is over, the user is prompter to validate and rate the service
The service status is changing to closed
The time-coin used for this service dissappears from the user profile

From the perspective of User2 (user without time-coin)
The user logs in
The user see a list of people looking for services in the feed (big list)
The user selects a service where he thinks he can help within one hour by pressing a button
(if) The user is selected by User1 (user who is looking for a service provider) he gets notified when cool down starts
(if) The user executes the service correctly within one hour he gets credited of one time-coin
User2 can now ask for some service

Stretch-goals:
If an user posts a service that cannot be executed within one hour or contains inappropriate contents, the post will be moderated/deleted.
=> we should give the possibility to users to signal inappropriate contents.

An user can buy a time-coin with real money instead of giving of his time to help others
An user can filter through all services in order to find the one with a certain keyword.
An user can select a category to filter across different type of services
Use map to locate services

Create job categories:
We should define job categories/subcategories in order to have clean posts and avoid moderation. The app should be very user friendly.
This will help us for the filters as well, a good structure of the content is very important. I can work on this subject.
exemple:
Catégorie: Petits bricolages éléctriques
job: Changer les ampoules dans la maison

=> we can then add some scoring for the  jobs for example taking out the dog will demand 50% physical effort and helping move big staff will ask 70% physical effort.
other job characteristics should be outside/inside and many funny stuff like that.

Ideas:
An user can warn for inapropriate contents in other users services
An user can rate user for the quality of service
An user MUST select 'categories' when creating the service
An user can filter by category

Tags/filtering/creating a service with n tags/categories:
Dehors/dedans
Assis/debout
Seul/groupe
Physique/nonphysical
Avec matériel/sans matériel

Todo:
-> Admins users / superusers
-> Timer for Services
-> User profiles
-> extend DB fields / Add migrations
-> More TDD for extra features:
    -> User have timecoins
    -> User loose timecoins when creating a service
    -> User gain timecoins when executing a service
-> Cleaning methods in services#controller for havemoney? et getrich?
-> Hiding link for routes such as deletes/new/create
-> Think about a notation system:
    -> An user can 'star' an user that gave him a service to say the quality of the service
    -> An user can 'star' an user that commanditate a service to say the quality of the contact with the serviceper

-> more forms validations for contents on service creation/help creations
-> Implement simpleforms for user login/signup
-> (more to come)...
