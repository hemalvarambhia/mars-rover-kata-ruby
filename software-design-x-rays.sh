#!/bin/bash
function change_frequency() {
  date="${1:-2024-01-01}"

  git log --name-only --date=short --format=format: --no-renames --after="$date" | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}

function complexity_trend() {
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start db1e201083a317bfba6694192c479dc4b55569e1 --end b55bce707daad1933bb165d5117fc74c75dac35a --file lib/mars_rover.rb
}