#!/bin/bash
set -e

bundle install

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

bundle exec rake assets:precompile
bundle exec rake assets:clean

echo "Build process completed successfully"