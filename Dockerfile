ARG RUBY_VERSION=3.0.6

FROM ruby:$RUBY_VERSION-alpine AS base

FROM base

RUN set -eux; \
     apk add --no-cache \
          g++ \
          make \
          bash \
    && rm -rf /var/cache/apk/*

RUN echo 'gem: --no-document' >> ~/.gemrc \
    && gem install minitest \
    && gem install activesupport \
    && gem install shoulda \
    && gem install byebug

COPY . /base-service-ruby
WORKDIR /base-service-ruby
