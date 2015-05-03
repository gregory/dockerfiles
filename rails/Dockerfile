FROM metakungfu/ruby

MAINTAINER Gregory Horion <public+dockerfiles@gregory.io>

COPY bin/ /usr/local/bin/

RUN rails_setup

WORKDIR /usr/src/app

ONBUILD copy ./Gemfile* /usr/src/app/

ONBUILD COPY bin/ /usr/local/bin

ONBUILD run bnl-apk-install-build-deps \
            && pre_bundle \
            && bundle install --system \
            && apk del build-deps

ONBUILD copy . /usr/src/app

ONBUILD run chown -R app:app $WORKDIR $GEM_HOME

ONBUILD run bundle config --global frozen 1
