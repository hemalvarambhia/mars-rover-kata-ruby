#!/bin/sh

bundle exec rspec --tag ~skip --format progress && git add -A && git commit -m "Test passes" || git reset --hard