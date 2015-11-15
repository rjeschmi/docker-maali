FROM rjeschmi/lmod:centos7-lmod6

MAINTAINER Robert Schmidt <rjeschmi@gmail.com>

RUN mkdir /build/maali
WORKDIR /build/maali

RUN yum -y install git
RUN git clone https://github.com/chrisbpawsey/maali.git

WORKDIR /build/maali/maali

RUN cp maali.config.example maali.config

RUN sed "s/^MAALI_OS=.*$/MAALI_OS=fedora20/" -i maali.config
RUN sed "s/^MAALI_SYSTEM=.*$/MAALI_SYSTEM=docker/" -i maali.config

RUN ./maali -t maali -v 1.0 -c maali -d
