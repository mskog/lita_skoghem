FROM litaio/ruby:latest

RUN apt-get update
RUN apt-get install -y git
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN gem install bundler --no-rdoc --no-ri

ENV BUNDLE_PATH /bundle

ADD Gemfile /code/Gemfile
ADD Gemfile.lock /code/Gemfile.lock
ADD lita_config.rb /code/lita_config.rb
ADD start /code/start

WORKDIR /code

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/bin/supervisord
