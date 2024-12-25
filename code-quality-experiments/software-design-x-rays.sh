#!/bin/bash
function change_frequency() {
  date="${1:-2024-01-01}"

  git log --name-only --date=short --format=format: --no-renames --after="$date" | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}

function complexity_trend() {
  starting_commit=$(git log --format="%H" --diff-filter=A -- lib/mars_rover.rb)
  finishing_commit=$(git log -1 --format="%H" -- lib/mars_rover.rb)
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start "$starting_commit" --end "$finishing_commit" --file lib/mars_rover.rb
}

function complexity_trend_of_point() {
  starting_commit=$(git log --format="%H" --diff-filter=A -- lib/point.rb)
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start "$starting_commit" --end 6c71b3c526534a74bfa9702c40b9557ae8ca9f5a --file lib/point.rb
}