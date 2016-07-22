#docker.io runmyprocess/grails

FROM alpine

ENV GRAILS_VERSION 3.1.8
ENV GRAILS_HOME /opt/grails

RUN mkdir /opt

RUN cd /opt && \
        apk -Uuv add groff less python py-pip bash ca-certificates libstdc++ openjdk8 curl && \
        curl -L https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip -o grails-${GRAILS_VERSION}.zip && \
        unzip grails-${GRAILS_VERSION}.zip -d /opt && \
        rm grails-${GRAILS_VERSION}.zip && \
        ln -s /opt/grails-${GRAILS_VERSION} /opt/grails &&\
        mkdir -p /aws && \
        pip install awscli && \
        rm /var/cache/apk/*

ENV PATH ${PATH}:${GRAILS_HOME}/bin:aws

