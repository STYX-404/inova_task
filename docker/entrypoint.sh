#!/bin/sh
rails db:prepare db:seed

FILE=/app/tmp/pids/server.pid

if test -f "$FILE"; then
  rm $FILE
fi

# puma -C config/puma.rb
sleep infinity
