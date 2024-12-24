#!/bin/bash
function change_frequency() {
  date="${1:-2024-01-01}"

  git log --name-only --date=short --format=format: --no-renames --after="$date" | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}

function complexity_trend() {
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start 940009903d54da750dd25f65ff3375cc52469c9b --end 7fe6901f599004961fe51376818deae04ea6902b --file lib/mars_rover.rb
}

function complexity_trend_of_point() {
    python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start 5e870dbc201b0ba1c36af11c05b967da985fcf80 --end 6c71b3c526534a74bfa9702c40b9557ae8ca9f5a --file lib/point.rb
}