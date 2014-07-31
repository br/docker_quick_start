#!/bin/bash
cd /app
source /etc/profile.d/rvm.sh

# Run database schema migration
bundle exec rake db:migrate

# Launch the Rails application with the Puma web server
bundle exec rails s Puma