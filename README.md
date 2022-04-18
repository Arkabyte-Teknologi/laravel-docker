# 🔥🐳 Arkabyte's laravel-docker 

<p align="center">
    <img src="https://user-images.githubusercontent.com/35098175/145682384-0f531ede-96e0-44c3-a35e-32494bd9af42.png" alt="docker-laravel">
</p>

## Introduction

Easily deploy Laravel application using docker-compose. Support https with let'sencrypt SSL.

## Usage

1. Clone this repo
2. Copy your Laravel project to /src folder
3. Execute the following command

## Without php artisan migrate:fresh --seed

```bash
$ make init # Build container with current laravel project
$ make install-recommend-packages # Optional
```

## With php artisan migrate:fresh --seed
```bash
# Build container with current laravel project and run php artisan migrate:fresh --seed
$ make init-fresh 
$ make install-recommend-packages # Optional
```

## Container structures

```bash
├── app # Laravel
└── web # Nginx
```

### app container

- Base image
  - [php](https://hub.docker.com/_/php):8.1-fpm-bullseye
  - [composer](https://hub.docker.com/_/composer):2.2

### web container

- Base image
  - [nginx](https://hub.docker.com/_/nginx):nginx:1.20-alpine



## Makefile usage

This is how Makefile translate command

Full list see this 

- Read this [Makefile](https://github.com/Arkabyte-Teknologi/laravel-docker/blob/main/Makefile).

### - docker compose up -d 

```
make up
```

### - docker-compose build --no-cache --force-rm

```
make build
```

### - php artisan migrate

```
make migrate
```

### - php artisan migrate:fresh --seed

```
make fresh
```

### - php artisan db:seed

```
make seed
```

### - php artisan dacapo

```
make dacapo
```