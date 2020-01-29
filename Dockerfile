FROM teamsprint/druid:0.9.1

MAINTAINER Jooho Kim

USER root

# Build with --build-arg METATRON_TAR=<METATRON_TAR>
# ex> docker build -t teamsprint/metatron:3.3.0 --build-arg METATRON_TAR=`ls metatron-discovery-*.tar.gz` .

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm \
        && yum install -y python36u python36u-libs python36u-devel python36u-pip \
        && unlink /bin/python \
        && ln -s /bin/python3.6 /bin/python \
        && ln -s /bin/pip3.6 /bin/pip \
        && pip install requests

# tar.gz is extracted automatically by docker
ARG METATRON_TAR

ADD $METATRON_TAR /servers
RUN cd servers; ln -s `ls | grep metatron-discovery-` metatron-discovery; cd ..

ENV METATRON_HOME /servers/metatron-discovery

ADD conf/application-config.yaml $METATRON_HOME/conf
ADD conf/metatron-env.sh $METATRON_HOME/conf
ADD conf/logback-console.xml $METATRON_HOME/conf

ADD script/init-metatron.sh /
ADD script/start-metatron.sh /
ADD script/stop-metatron.sh /
ADD script/prepare-all-metatron.sh /

RUN mkdir tool
ADD tool/preptool /tool
ADD tool/preptool-test.sh /tool
ADD tool/s5k_1.csv /tool

RUN mkdir sample
ADD sample/* /sample/

ADD Dockerfile /
ADD README.md /

CMD ["/bin/bash"]

# Metatron port
EXPOSE 8180

