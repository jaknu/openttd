FROM ubuntu:16.10

RUN apt -y update && apt -y upgrade
RUN apt -y install openttd

COPY openttd.cfg /root/.openttd/openttd.cfg
COPY serverstart.sh /serverstart.sh

EXPOSE 3979/tcp
EXPOSE 3979/udp

CMD ["/serverstart.sh"]

