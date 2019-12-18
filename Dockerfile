FROM teamsprint/druid:0.9.1

MAINTAINER Jooho Kim

USER root

# Build with --build-arg METATRON_TAR=<METATRON_TAR>
# ex> docker build -t teamsprint/metatron:3.3.0 --build-arg METATRON_TAR=`ls metatron-discovery-*.tar.gz` .

# tar.gz is extracted automatically by docker
ARG METATRON_TAR

ADD $METATRON_TAR /servers
RUN cd servers; ln -s `ls | grep metatron-discovery-` metatron-discovery; cd ..

ENV METATRON_HOME /servers/metatron-discovery

ADD conf/application-config.yaml $METATRON_HOME/conf
ADD conf/metatron-env.sh $METATRON_HOME/conf

ADD script/init-metatron.sh /
ADD script/start-metatron.sh /
ADD script/stop-metatron.sh /
ADD script/prepare-all-metatron.sh /

ADD Dockerfile /
ADD README.md /

CMD ["/bin/bash"]

# Metatron port
EXPOSE 8180

