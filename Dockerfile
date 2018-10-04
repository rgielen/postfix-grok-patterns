FROM ruby:2.5-stretch

ENV POSTFIX_GROK_PATTERNS_HOMEDIR=/postfix-grok-patterns
ENV DEBIAN_FRONTEND noninteractive

RUN gem install jls-grok minitest

RUN apt-get update && apt-get -y install git locales debconf \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /tmp/*

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales && echo 'LANG="en_US.UTF-8"' >> /etc/default/locale

ENV LANG="en_US.UTF-8"
ENV RUBYOPT="-KU -E utf-8:utf-8"

COPY . $POSTFIX_GROK_PATTERNS_HOMEDIR
WORKDIR $POSTFIX_GROK_PATTERNS_HOMEDIR
RUN git submodule update --init

CMD [ "sh", "-c", "ruby test/test.rb" ]
