#!/bin/sh

bundle exec rspec --format progress && git commit -am "Test passes" || git restore lib