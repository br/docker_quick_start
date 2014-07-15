FROM yhuang/debian_hartl_gems
MAINTAINER Jimmy Y. Huang <jhuang@bleacherreport.com>

# Usually, after you run nginx from terminal, it spawns several processes and
# the master process exit. In that case, docker will terminate its container.
# To prevent that, we want to modify the Nginx configuration file to keep the
# master process running after spawning.
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

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
