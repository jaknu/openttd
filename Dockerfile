FROM ubuntu:16.10

RUN apt -y update && apt -y upgrade
RUN apt -y install openttd

EXPOSE 3979/tcp
EXPOSE 3979/udp

CMD ["/usr/games/openttd", "-D"]

