#!/bin/sh

bundle exec rspec --format progress -cfd && git commit -am "Test passes" || git restore lib