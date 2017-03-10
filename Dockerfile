FROM ubuntu:16.04
MAINTAINER Damian Ziobro <damian@xmementoit.com>

ENV USER docker
ENV HOME /home/$USER

RUN apt-get -y update && apt-get -y install sudo librarian-puppet 

RUN useradd -ms /bin/bash $USER && adduser $USER sudo && echo 'docker:docker123' | chpasswd && \
    echo "ALL ALL=NOPASSWD:  /usr/bin/puppet" >> /etc/sudoers

EXPOSE 22 80 

RUN rm -rf /etc/puppet
ADD puppet /etc/puppet

#========================================================
# switching to user docker
USER $USER
ENV USER docker
ENV HOME /home/$USER

WORKDIR $HOME

RUN sudo puppet apply /etc/puppet/manifests/install.pp
