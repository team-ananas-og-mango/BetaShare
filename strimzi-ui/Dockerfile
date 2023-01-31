FROM quay.io/strimzi/kafka:0.32.0-kafka-3.3.1

ENV CC_UI_VERSION=0.4.0
ENV CC_UI_HOME=./cruise-control-ui/dist/

USER root

RUN mkdir -p ${CC_UI_HOME}

RUN curl -LO https://github.com/linkedin/cruise-control-ui/releases/download/v${CC_UI_VERSION}/cruise-control-ui-${CC_UI_VERSION}.tar.gz; \
    tar xvfz cruise-control-ui-${CC_UI_VERSION}.tar.gz -C ${CC_UI_HOME} --strip-components=2; \
    rm -f cruise-control-ui-${CC_UI_VERSION}.tar.gz*; \
    echo "dev,dev,/kafkacruisecontrol/" > "${CC_UI_HOME}"static/config.csv;

USER 1001