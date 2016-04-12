FROM alpine:3.3

MAINTAINER Ruben Dopazo (ruben.dopazo@gmail.com)

# to install openJDK7
#apk --update add openjdk7-jre

# to install OracleJDK8
COPY ./lib/* /tmp/

RUN apk --update add curl ca-certificates tar &&\ 
  apk add --allow-untrusted /tmp/glibc-2.21-r2.apk &&\
  mkdir /opt &&\
  tar -xzf /tmp/jdk-8u77-linux-x64.tar.gz -C /opt &&\
  ln -s /opt/jdk1.* /opt/jdk &&\
  rm -rf /opt/jdk/*src.zip \
    /opt/jdk/lib/missioncontrol \
    /opt/jdk/lib/visualvm \
    /opt/jdk/lib/*javafx* \
    /opt/jdk/jre/lib/plugin.jar \
    /opt/jdk/jre/lib/ext/jfxrt.jar \
    /opt/jdk/jre/bin/javaws \
    /opt/jdk/jre/lib/javaws.jar \
    /opt/jdk/jre/lib/desktop \
    /opt/jdk/jre/plugin \
    /opt/jdk/jre/lib/deploy* \
    /opt/jdk/jre/lib/*javafx* \
    /opt/jdk/jre/lib/*jfx* \
    /opt/jdk/jre/lib/amd64/libdecora_sse.so \
    /opt/jdk/jre/lib/amd64/libprism_*.so \
    /opt/jdk/jre/lib/amd64/libfxplugins.so \
    /opt/jdk/jre/lib/amd64/libglass.so \
    /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
    /opt/jdk/jre/lib/amd64/libjavafx*.so \
    /opt/jdk/jre/lib/amd64/libjfx*.so &&\
  rm -rf /tmp/*

ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

CMD ["java", "-version"]

EXPOSE 8080