#!/bin/bash
cd /app
source /etc/profile.d/rvm.sh

bundle exec rake db:migrate
bundle exec rails s Puma
