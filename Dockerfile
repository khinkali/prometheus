FROM jboss/base
MAINTAINER Robert Brem <brem_robert@hotmail.com>

ENV VERSION 2.0.0
ENV ARCHIVE prometheus-${VERSION}.linux-amd64
ENV INSTALL_DIR .
ENV SERVER_HOME ${INSTALL_DIR}/${ARCHIVE}
RUN curl -o ${SERVER_HOME}.tar.gz -L https://github.com/prometheus/prometheus/releases/download/v${VERSION}/${ARCHIVE}.tar.gz \
            && tar xvfz ${SERVER_HOME}.tar.gz
WORKDIR ./${ARCHIVE}
COPY prometheus.yml .
ENTRYPOINT ./prometheus --config.file=prometheus.yml
USER root
RUN yum install git -y
USER jboss
EXPOSE 9090
