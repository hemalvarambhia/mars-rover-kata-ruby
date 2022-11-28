#!/bin/sh

bundle exec rake test && git add lib || git restore lib