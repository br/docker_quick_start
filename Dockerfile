FROM debian:jessie
MAINTAINER Jimmy Y. Huang <jhuang@bleacherreport.com>

RUN apt-get update && apt-get install -qy \
 curl \
 git \
 libpq-dev \
 nginx \
 nodejs \
 postgresql

# Install rvm, ruby, bundler
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.2"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# set WORKDIR
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# bundle install
RUN /bin/bash -l -c "bundle install"

#####

ADD . /app

COPY config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Open port 3000
EXPOSE 3000

# Overridable Startup commands
CMD ["/usr/bin/start-server"]
