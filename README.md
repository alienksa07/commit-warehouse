# spiped [![Build Status](https://travis-ci.org/TimWolla/docker-spiped.svg?branch=master)](https://travis-ci.org/TimWolla/docker-spiped)

## What is spiped?

Spiped (pronounced "ess-pipe-dee") is a utility for creating symmetrically encrypted and authenticated pipes between socket addresses, so that one may connect to one address (e.g., a UNIX socket on localhost) and transparently have a connection established to another address (e.g., a UNIX socket on a different system). This is similar to `ssh -L` functionality, but does not use SSH and requires a pre-shared symmetric key.

> [tarsnap.com/spiped.html](https://www.tarsnap.com/spiped.html)

## How to use this image

This image automatically takes the key from the `/spiped/key` file (`-k`) and runs spiped in foreground (`-F`). Other than that it takes the same options *spiped* itself does. You can list the available flags by running the image without arguments:

	$ docker run -it --rm timwolla/spiped
	usage: spiped {-e | -d} -s <source socket> -t <target socket> -k <key file>
	    [-DFj] [-f | -g] [-n <max # connections>] [-o <connection timeout>]
	    [-p <pidfile>] [-r <rtime> | -R]

For example running spiped to take encrypted connections on port 8025 and forward them to port 25 on localhost would look like this:

	$ docker run -d -v /path/to/keyfile:/spiped/key:ro -p 8025:8025 timwolla/spiped -d -s '[0.0.0.0]:8025' -t '[127.0.0.1]:25'

Usually you would combine this image with another linked container. The following example would take encrypted connections on port 9200 and forward them to port 9200 in the container with the name `elasticsearch`:

	$ docker run -d -v /path/to/keyfile:/spiped/key:ro -p 9200:9200 --link elasticsearch:elasticsearch timwolla/spiped -d -s '[0.0.0.0]:9200' -t 'elasticsearch:9200'

If you don’t need any to bind to a privileged port you can pass `--user spiped` to make *spiped* run as an unprivileged user:

	$ docker run -d -v /path/to/keyfile:/spiped/key:ro --user spiped -p 9200:9200 --link elasticsearch:elasticsearch timwolla/spiped -d -s '[0.0.0.0]:9200' -t 'elasticsearch:9200'

### Generating a key

You can save a new keyfile named `spiped-keyfile` to the folder `/path/to/keyfile/` by running:

	$ docker run -it --rm -v /path/to/keyfile:/spiped/key timwolla/spiped spiped-generate-key.sh

Afterwards transmit `spiped-keyfile` securely to another host (e.g. by using scp).
