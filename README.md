# docker
Dockerfiles for creating development environments.

## Building the images
Dependencies for building the images are handled by the Makefile. Run `make` to build all of the images or specify one of the following language targets as `make <target>`.

- go
- python

## Running the images
The entrypoint.sh script requires that the `LOCAL_USER_ID` variable be set when run. Do so by passing the argument `-e LOCAL_USER_ID=``id -u`` ` to `docker run` or by using the `docker-runuser` utility included which will do this for you. This script can be installed to the location of your choice by running the following command.

```sh
$ make install PREFIX=PATH_TO_INSTALL
```

If you do not specify a prefix, the script will be installed to `/usr/local/bin`.

## Customization
You may change the username created in the image by specifying the `USER` environment variable when building. In that case, specify `make <target> USER=<username>`.