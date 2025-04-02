#!/bin/sh

bundle exec rspec --tag ~skip --format progress && git commit -am "Test passes" || git reset --hard