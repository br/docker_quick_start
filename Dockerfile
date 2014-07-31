FROM yhuang/debian_hartl_gems
MAINTAINER Jimmy Y. Huang <jhuang@bleacherreport.com>

ADD . /app

COPY config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Open port 3000
EXPOSE 3000

# Overridable Startup commands
CMD ["/usr/bin/start-server"]
