FROM metakungfu/base

MAINTAINER Gregory Horion <public+dockerfiles@gregory.io>

COPY bin/ /usr/local/bin/

RUN apk-install ca-certificates=20141019-r0

ENV RUBY_VERSION 2.2.0

RUN bnl-apk-install-download-deps \
    && bnl-apk-install-build-deps \
    && cd /home \
    && bnl-download-and-verify B9515E77 \
       https://raw.github.com/postmodern/ruby-install/master/pkg/ruby-install-0.5.0.tar.gz.asc \
       https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz \
    && cd ruby-install-0.5.0/ \
    && make install \
    && cd .. \
    && rm -r /home/ruby-install-0.5.0/ \
    && apk-install-ruby-deps \
    && ruby-install ruby $RUBY_VERSION -- --disable-install-rdoc \
    && apk del download-deps build-deps ruby-deps \
    && rm -r /usr/local/src/ruby-${RUBY_VERSION}* \
    && rm -rf /var/cache/apk/*

ENV PATH /opt/rubies/ruby-${RUBY_VERSION}/bin:$PATH
ENV GEM_HOME /usr/lib/ruby/gems/${RUBY_VERSION}
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_APP_CONFIG $GEM_HOME

RUN mkdir -p /opt/rubies/ruby-${RUBY_VERSION}/etc \
    && echo 'gem: --no-document' > /opt/rubies/ruby-${RUBY_VERSION}/etc/gemrc \
    && gem install bundler \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin" \
    && bundle config --global retry 3

ONBUILD RUN bundle config --global jobs $(grep processor /proc/cpuinfo | tail -n1 | awk -F: '{ print $2 + 1 }')

CMD ["irb"]
