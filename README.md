stack-example-bedrock
===

Example project for running a [Bedrock](https://roots.io/bedrock/) based
WordPress site on [Presslabs Stack](https://www.presslabs.com/stack).

## Quickstart

In order to create a similar project you need run the following commands.

```console
$ composer create-project roots/bedrock my-site
$ cd my-site
$ composer require presslabs/stack-mu-plugin
$ ln -sf mu-plugins/stack-mu-plugin/src/object-cache.php web/app/object-cache.php
```

## Building docker images

Presslabs Stack provides a base image for building and developing WordPress
sites using Bedrock. The `Dockerfile` is as simple as:

```Dockerfile
FROM quay.io/presslabs/wordpress-runtime:bedrock-build as builder
FROM quay.io/presslabs/wordpress-runtime:bedrock
COPY --from=builder --chown=www-data:www-data /app /app
```

## Development

Local development can be done as you normally do, either running php locally,
or using docker or vagrant. Remember that Bedrock is configures trough
environment, and for setting up you should edit `.env` file.

### wp-cli local server

Bedrock comes configured for running WordPress trough wp-cli. To start the
server you just need to run:

```console
$ wp server
```

And then you can visit [http://localhost:8080](http://localhost:8080)

### docker and docker-compose

The [docker-compose.yaml](docker-compose.yaml) in this repo provides a good
starting point for doing local development with docker. To boot up WordPress and
MySQL server run:

```console
$ docker-compose up -d
```

To install a plugin you can just:

```console
$ docker-compose run wordpress composer require wpackagist-plugin/debug-bar
```

If you are using docker compose, remember that the image built from the above
`Dockerfile` already includes nginx and it's accessible on port 8080. For
customizing the environment also check
[https://github.com/presslabs/stack-runtimes/blob/master/php/README.md](https://github.com/presslabs/stack-runtimes/blob/master/php/README.md).
