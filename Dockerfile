FROM ruby:3.1.3

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs

COPY . /usr/src/app/
ARG SECRET_KEY_BASE

WORKDIR /usr/src/app
ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}
RUN gem install bundler:2.4.12
RUN bundle install
RUN rake db:migrate
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}
RUN ./bin/rails assets:precompile
CMD [ "rails", "server" ]