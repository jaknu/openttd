# jaknu OpenTTD server

This is a dedicated server for [OpenTTD](https://www.openttd.org) packed into a docker image. I try to keep it as simple as possible.

Theres another version of this packed with some selected OpenGRFs in [the opengrfed branch](https://github.com/jaknu/openttd/tree/newgrfed).

## Running it
The only requirement for running this is [docker](https://www.docker.com/).

New build are automatically pushed to [dockerhub](https://hub.docker.com/r/jaknu/openttd) so to run it just do this:

    docker run -d -p 3979:3979/tcp -p 3979:3979/udp jaknu/openttd

It doesn't create any volumes by default, so if you want to keep the savegames between containers, you'll probably want to do something like this:

    docker run -d -v SAVE_DIR_ON_HOST:/root/.openttd/save -p 3979:3979/tcp -p 3979:3979/udp jaknu/openttd

