FROM ubuntu:16.10

RUN apt -y update && apt -y install openttd && rm -r /var/lib/apt/lists/*

ADD http://binaries.openttd.org/bananas/newgrf/FIRS_2-2.1.5.tar.gz                    /tmp
ADD http://binaries.openttd.org/bananas/newgrf/FISH_2-2.0.3.tar.gz                    /tmp
ADD http://binaries.openttd.org/bananas/newgrf/CHIPS_Station_Set-1.7.0.tar.gz         /tmp
ADD http://binaries.openttd.org/bananas/newgrf/av8_Aviators_Aircraft_Set-2.21.tar.gz  /tmp
ADD http://binaries.openttd.org/bananas/newgrf/OpenGFX_Trees-0.8.0.tar.gz             /tmp
ADD http://binaries.openttd.org/bananas/newgrf/Total_Town_Replacement_Set-3.14.tar.gz /tmp
ADD http://binaries.openttd.org/bananas/newgrf/eGRVTS2-188.tar.gz                     /tmp
ADD http://binaries.openttd.org/bananas/newgrf/OpenGFX_Trains-0.3.0.tar.gz            /tmp

RUN mkdir -p /root/.openttd/newgrf                                                 &&\
    tar -xvf /tmp/FIRS_2-2.1.5.tar.gz                    -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/FISH_2-2.0.3.tar.gz                    -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/CHIPS_Station_Set-1.7.0.tar.gz         -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/av8_Aviators_Aircraft_Set-2.21.tar.gz  -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/OpenGFX_Trees-0.8.0.tar.gz             -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/Total_Town_Replacement_Set-3.14.tar.gz -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/eGRVTS2-188.tar.gz                     -C /root/.openttd/newgrf/ &&\
    tar -xvf /tmp/OpenGFX_Trains-0.3.0.tar.gz            -C /root/.openttd/newgrf/ &&\
    rm /tmp/*

ADD jaknu_newgrfed_default.sav /root/.openttd/save/autosave/

COPY openttd.cfg    /root/.openttd/openttd.cfg
COPY serverstart.sh /serverstart.sh

EXPOSE 3979/tcp
EXPOSE 3979/udp

CMD ["/serverstart.sh"]

