# inventist

## Developmernt guide

### Setup for development


build docker image:

```
$ docker-compose build
```

install dependencies:

```
$ docker-compose run --rm app bundle i
$ docker-compose run --rm app yarn
```

create database and migrations:

```
$ docker-compose run --rm app rails db:create
$ docker-compose run --rm app rails db:migrate
```

setup data fixture:

```
$ docker-compose run --rm app rails db:seed
```

### run applications

run dev server:

```
$ docker-compose up
$ open http://localhost:3000/
```

launch psql client:

```
$ docker-compose run --rm app rails db
```
