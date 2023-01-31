FROM quay.io/strimzi/kafka:0.34.0-kafka-3.4.0
USER root:root
COPY ./plugins/* /opt/kafka/plugins/
RUN cd /opt/kafka/plugins/ && unzip /opt/kafka/plugins/confluentinc-kafka-connect-s3-10.4.2.zip
RUN rm /opt/kafka/plugins/confluentinc-kafka-connect-s3-10.4.2.zip
USER 1001