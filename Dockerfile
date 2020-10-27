FROM ubuntu:20.04
#Basic deps
RUN apt-get update \
&& apt-get install -y wget htop iotop gnupg curl netcat vim

RUN wget --quiet -O - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - \
&& wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
&& echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list \
&& echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
&& apt-get update

RUN apt-get install -y mongodb-org-shell mongodb-org-tools
RUN apt-get install -y postgresql-client-12
RUN apt-get install -y default-jre && java --version

#Kafka Client
RUN wget -q https://archive.apache.org/dist/kafka/2.2.1/kafka_2.12-2.2.1.tgz \
&& tar -xzf kafka_2.12-2.2.1.tgz && rm kafka_2.12-2.2.1.tgz
