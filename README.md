# ChatsApp on Rails


## Currently running:
* Concepting users
* Database for users, DMs, messages, & sessions
* hashed passwords
* per user salted passwords
* Sessions
* Log in & out
* Sign up/create drivers & staff
* * driver to staff message sending

## To do:
* area noticeboard
* Bring Websockets back #fashun
* Tidy up websocket and types
* Websocket features: ~~onine~~, typing, ~~reacting to messages~~

# Road to MVP
* Fix expire button
* Implement styling
* Add navigation
* Add migrations/seed to populate DB
* Attempt websockets for "online/offline", "typing", and bonus: "reactions"


## Ideas:
* Webtraffic over TOR
* Device/session based message encryption
* Messages saved on device not in DB

sender id important for auditing (internal id)
recipient id important (who the message is going to, nil when notice board)
message type (area coord or dispatcher, notice board)
area id (qtown/ashburton/etc)
expiry nullable 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Run seed
set notices to have areas