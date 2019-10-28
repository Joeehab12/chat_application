# Instabug Backend Challenge

This repository holds all the source code of the Instabug Backend Challenge Chatting Application

## Ruby Version
This application runs on Ruby version 2.5.1

## Installation

Use [docker-compose](https://github.com/docker/compose) to install the application.

```bash
$ docker-compose up
```

Create the database

```bash
$ docker-compose run web rake db:create
```

Run database migrations to create database tables


```bash
$ docker-compose run web rake db:migrate
```

## Testing

You can use [Postman](https://www.getpostman.com/) to test the application's endpoints

* GET /applications
* GET /applications/:token
* POST /applications
* PUT /applications/:token
* GET /applications/:token/chats
* GET /applications/:token/chats/:id
* POST /applications/:token/chats
* PUT /applications/:token/chats/:id
* GET /applications/:token/chats/:id/messages
* GET /applications/:token/chats/:id/messages/:msg_id
* POST /applications/:token/chats/:id/messages
* POST /applications/:token/chats/:id/messages//:query
* PUT /applications/:token/chats/:id/messages/:msg_id

## License
[MIT](https://choosealicense.com/licenses/mit/)
