smap_stack
==========

A set of scripts for deploying sMAP on Docker

To build: 

  host$ git clone https://github.com/immesys/smap_stack.git smap_stack && cd smap_stack
  host$ docker build -t smap .

To deploy

  host$ docker run -t -i smap /bin/bash
  container$ /srv/repo/config.sh
  <enter desired django root password>
  <type ctrl-p ctrl-q to disconnect from container>

