#!/bin/sh

bundle exec rake test && git commit -am "Test passes" || git restore lib