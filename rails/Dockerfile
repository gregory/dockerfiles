FROM metakungfu/ruby

RUN apk update \
    && bnl-apk-install-build-deps \
    && apk-install libxml2-dev \
                   libxslt-dev \
                   yaml-dev \
                   nodejs \
    && gem install foreman \
    && apk del build-deps python paxctl \
    && rm -rf /var/cache/apk/* /usr/lib/python2.7 \
    /usr/share/man /tmp/* /var/tmp/* \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html

WORKDIR /usr/src/app

ONBUILD COPY ./Gemfile /usr/src/app/
ONBUILD COPY ./Gemfile.lock /usr/src/app/

ONBUILD RUN bnl-apk-install-build-deps \
            && bundle config --global build.nokogiri --use-system-libraries \
            && bundle install --system \
            && apk del build-deps

ONBUILD COPY . /usr/src/app

ONBUILD RUN chown -R app:app $WORKDIR $GEM_HOME

ONBUILD RUN bundle config --global frozen 1

CMD foreman start
