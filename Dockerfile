FROM ubuntu:xenial
MAINTAINER Boro <docker@bo.ro>

RUN add-apt-repository ppa:cz.nic-labs/bird -y
RUN apt-get update -y
RUN apt-get install bird -y

# Make a backup of the default config files
RUN cp /etc/bird/bird.conf /etc/bird/bird.default.conf
RUN cp /etc/bird/bird6.conf /etc/bird/bird6.default.conf

ADD bird.conf /etc/bird/bird.template.conf
ADD bird6.conf /etc/bird/bird6.template.conf

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD /start.sh