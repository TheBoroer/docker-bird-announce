FROM ubuntu:xenial
MAINTAINER Boro <docker@bo.ro>

RUN sudo locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:cz.nic-labs/bird
RUN apt-get update
RUN apt-get install y bird

# Make a backup of the default config files
RUN cp /etc/bird/bird.conf /etc/bird/bird.default.conf
RUN cp /etc/bird/bird6.conf /etc/bird/bird6.default.conf

ADD bird.conf /etc/bird/bird.template.conf
ADD bird6.conf /etc/bird/bird6.template.conf

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD /start.sh