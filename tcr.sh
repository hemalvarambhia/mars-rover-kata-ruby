#!/bin/sh

bundle exec rake test && git add . || git restore .