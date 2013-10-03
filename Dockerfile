# An sMAP dockerfile
#
# VERSION 0.0.1
FROM ubuntu:12.10
MAINTAINER Michael Andersen <michael@steelcode.com>

#RUN echo "deb http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ precise main universe multiverse" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y python-setuptools build-essential python-dev mercurial vim monit
RUN easy_install pip
#--------------
#Readingdb deps
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d
RUN apt-get install -y libdb5.3-dev libprotobuf-dev libprotoc-dev zlib1g-dev python-numpy swig postgresql git autoconf libtool check libprotobuf-c0-dev protobuf-c-compiler pkg-config postgresql postgresql-contrib python-psycopg2
 
#Powerdb2 deps
RUN apt-get install -y subversion libcurl4-openssl-dev apache2 python-twisted python-scipy apache2-utils libapache2-mod-python python-openssl python-django nginx python-flup libapache2-mod-wsgi 
RUN pip install twisted ply zope.interface avro configobj python-dateutil httplib2 django-piston pycurl

#Get some sources
RUN mkdir /srv/src
RUN git clone git://github.com/stevedh/readingdb.git /srv/src/readingdb
RUN svn checkout http://smap-data.googlecode.com/svn/trunk/ /srv/smap
RUN svn checkout http://smap-data.googlecode.com/svn/branches/powerdb2 /srv/powerdb2
ADD . /srv/repo
#Utility scripts for stuff that Docker can't do

#Make some sources
RUN cd /srv/src/readingdb && autoreconf --install && ./configure --prefix=/ && make && make install && cd iface_bin && make && make install
RUN cd /srv/repo && ./mk_archiver.sh
RUN cd /srv/smap/python && python setup.py install
RUN mkdir -p /etc/smap
RUN cp /srv/smap/python/conf/archiver.ini /etc/smap/
RUN cp /srv/smap/python/monit/archiver /etc/monit/conf.d
RUN cp /srv/repo/powerdb2_site /etc/apache2/sites-available
RUN cd /etc/apache2/sites-enabled && rm * && ln -s ../sites-available/powerdb2_site powerdb2_site
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN cp /srv/repo/postgresql_monit.conf /etc/monit/conf.d/
#RUN cp /srv/repo/sshd_monit.conf /etc/monit/conf.d/
RUN cp /srv/repo/apache_monit.conf /etc/monit/conf.d/
RUN cd /srv/repo && ./mk_django.sh

#RUN apt-get install -y openssh-server
#RUN echo root:smappypasword | chpasswd

EXPOSE 80:80
EXPOSE 81
EXPOSE 22

CMD /bin/bash
#Need to run syncdb


#RUN pip install httplib2
#These are dependencies of the postinstall so it makes it faster

#RUN apt-get install -y openssh-server
#RUN echo root:smappypasword | chpasswd
#ADD . /srv/src
#RUN cp /srv/src/postgresql_monit.conf /etc/monit/conf.d/
#RUN cp /srv/src/apache_monit.conf /etc/monit/conf.d/
#RUN cp /srv/src/sshd_monit.conf /etc/monit/conf.d/
#EXPOSE 80
#CMD monit -I

