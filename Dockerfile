FROM teamsprint/druid:0.9.1

MAINTAINER Jooho Kim

USER root

# Build with --build-arg METATRON_TAR=<METATRON_TAR>
# ex> docker build -t teamsprint/metatron:3.3.0 --build-arg METATRON_TAR=`ls metatron-discovery-*.tar.gz` .

ARG METATRON_TAR

# tar.gz is extracted automatically by docker
#RUN mkdir /servers
ADD $METATRON_TAR /servers
RUN cd servers; ln -s `ls | grep metatron-discovery-` metatron-discovery; cd ..

ENV METATRON_HOME /servers/metatron-discovery

ADD conf/application-config.yaml $METATRON_HOME/conf
ADD conf/metatron-env.sh $METATRON_HOME/conf

ADD Dockerfile /
ADD README.md /

ADD script/init-metatron-metadb.sh /
ADD script/init-metatron.sh /
ADD script/start-metatron.sh /
ADD script/stop-metatron.sh /

CMD ["/bin/bash"]

# Metatron port
EXPOSE 8180

