FROM metakungfu/base

MAINTAINER Gregory Horion <public+dockerfiles@gregory.io>

COPY bin/ /usr/local/bin/

ENV RUBY_VERSION 2.2.0

ENV PATH /opt/rubies/ruby-${RUBY_VERSION}/bin:$PATH
ENV GEM_HOME /usr/lib/ruby/gems/${RUBY_VERSION}
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN install_ruby

RUN mkdir -p /usr/local/lib/ruby/${RUBY_VERSION}/etc \
    && echo 'gem: --no-document' > /usr/local/lib/ruby/${RUBY_VERSION}/etc/gemrc \
    && gem install bundler \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin" \
    && bundle config --global retry 3

ONBUILD RUN bundle config --global jobs $(grep processor /proc/cpuinfo | tail -n1 | awk -F: '{ print $2 + 1 }')

CMD ["irb"]
