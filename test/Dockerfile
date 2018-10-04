FROM ruby:2.5-stretch

ENV WORKDIR=/var/work
ENV DEBIAN_FRONTEND noninteractive

RUN gem install jls-grok minitest && mkdir $WORKDIR

RUN apt-get update && apt-get -y install git locales debconf \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /tmp/*

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales && echo 'LANG="en_US.UTF-8"' >> /etc/default/locale

VOLUME $WORKDIR
ENV LANG="en_US.UTF-8"
ENV RUBYOPT="-KU -E utf-8:utf-8"

CMD [ "sh", "-c", "cd $WORKDIR && git submodule update --init && ruby test/test.rb" ]
