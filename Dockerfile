#docker.io runmyprocess/grails

FROM alpine:3.4

ENV OPENJDK8_VERSION 8.111.14-r0
ENV GRAILS_VERSION 4.0.9
ENV GRAILS_HOME /opt/grails

RUN mkdir /opt && \
        cd /opt && \
        apk -Uuv add groff less python py-pip bash ca-certificates libstdc++ openjdk8=${OPENJDK8_VERSION} curl && \
        curl -L https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip -o grails-${GRAILS_VERSION}.zip && \
        unzip grails-${GRAILS_VERSION}.zip -d /opt && \
        rm grails-${GRAILS_VERSION}.zip && \
        ln -s /opt/grails-${GRAILS_VERSION} /opt/grails &&\
        mkdir -p /aws && \
        pip install awscli && \
        rm /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${GRAILS_HOME}/bin:/aws

