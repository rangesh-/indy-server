FROM ubuntu:18.04

ARG uid=1000

# Install environment
RUN apt-get update -y && apt-get install -y \
        git \
        wget \
        python3.5 \
        python3-pip \
        python-setuptools \
        python3-nacl \
        apt-transport-https \
        ca-certificates \
        supervisor


RUN pip3 install -U \
        pip==20.2 \
        setuptools


RUN apt install software-properties-common -y

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt update

RUN apt install python3.7 -y


RUN apt-get install libssl-dev swig -y
RUN apt-get install -y graphviz-dev -y

RUN apt-get install python3 python2.7-dev python3.6-dev \
     python3.7-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python-pip -y

RUN apt-get install python-dev  \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python-pip
RUN apt install libeccodes-dev -y

RUN pip install setuptools --upgrade

RUN pip3 install setuptools --upgrade

RUN apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev -y


RUN pip3 install -U \
         Cython

RUN apt-get install libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev libzstd-dev -y


RUN apt-get install librocksdb-dev -y

#RUN apt-get install -y libliz4-dev
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68DB5E88
RUN add-apt-repository "deb https://repo.sovrin.org/sdk/deb xenial stable"
RUN apt-get update
RUN apt-get install -y libindy=1.14.2


RUN alias python='/usr/bin/python3.7'

RUN . ~/.bashrc

RUN  apt-get install liblz4-dev

RUN python --version

#VOLUME /home/ubuntu/von-network : /von-network

#RUN mkdir von-network


RUN pip3 install -U \
         setuptools \
         pyyaml \
         aiodns \
         aiohttp \
         aiohttp-jinja2 \
         aiosqlite \
         base58 \
         cchardet \
         rlp \
         supervisor \
         indy-plenum \
         python3-indy


RUN useradd -ms /bin/bash -u $uid indy

RUN exec "$@"

EXPOSE 9000
#RUN cd /von-network
#RUN GENESIS_FILE=/.../local-genesis.txt PORT=9000 REGISTER_NEW_DIDS=true python3 -m server.server
