FROM jdubois/jhipster-docker
MAINTAINER "Ignacio Pascual <ignacio@talosdigital.com>"

USER root

RUN apt-get -y install at

RUN apt-get -y install supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor

RUN apt-get -y remove maven*
RUN apt-get -y install gdebi
RUN wget http://ppa.launchpad.net/natecarlson/maven3/ubuntu/pool/main/m/maven3/maven3_3.2.1-0~ppa1_all.deb
RUN gdebi -n maven3_3.2.1-0~ppa1_all.deb
RUN ln -s /usr/share/maven3/bin/mvn /usr/bin/maven
RUN ln -s /usr/share/maven3/bin/mvn /usr/bin/mvn


CMD ["/usr/bin/supervisord", "-n"]
