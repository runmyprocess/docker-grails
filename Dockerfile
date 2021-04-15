#docker.io runmyprocess/grails

FROM amazoncorretto:11

ENV GRAILS_VERSION 4.0.9
ENV GRAILS_HOME /opt/grails

RUN cd /opt && \
    yum install -y groff less python2-pip ca-certificates libstdc++ curl unzip && \
    curl -L https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip -o grails-${GRAILS_VERSION}.zip && \
    unzip grails-${GRAILS_VERSION}.zip -d /opt && \
    rm grails-${GRAILS_VERSION}.zip && \
    ln -s /opt/grails-${GRAILS_VERSION} /opt/grails && \
    mkdir -p /aws && \
    pip install awscli && \
    yum clean all && \
    rm -rf /var/cache/yum

ENV PATH ${PATH}:${GRAILS_HOME}/bin:/aws

