FROM yhuang/debian_hartl_gems
MAINTAINER Jimmy Y. Huang <jhuang@bleacherreport.com>

ADD config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# set WORKDIR
ADD . /app
WORKDIR /app

RUN apt-get install -qy nodejs
RUN /bin/bash -l -c "bundle install"

# Publish port 3000
EXPOSE 3000

# Startup commands
CMD ["/usr/bin/start-server"]
