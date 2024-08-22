# ChatsApp on Rails


## Currently running:
* Concepting users
* Database for users, DMs, messages, & sessions
* hashed passwords
* per user salted passwords
* Sessions
* Log in & out
* Sign up/create user

## To do:
* User to user message sending
* Bring Websockets back #fashun
* Global chat (notice board) working
* Tidy up websocket and types
* Websocket features: ~~onine~~, typing, ~~emojis~~


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
