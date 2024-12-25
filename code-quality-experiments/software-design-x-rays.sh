#!/bin/bash
function change_frequency() {
  date="${1:-2024-01-01}"

  git log --name-only --date=short --format=format: --no-renames --after="$date" | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}

function complexity_trend() {
  ruby_script=lib/mars_rover.rb
  starting_commit=$(git log --format="%H" --diff-filter=A -- $ruby_script)
  finishing_commit=$(git log -1 --format="%H" -- $ruby_script)
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start "$starting_commit" --end "$finishing_commit" --file $ruby_script
}

function complexity_trend_of_point() {
  starting_commit=$(git log --format="%H" --diff-filter=A -- lib/point.rb)
  finishing_commit=$(git log -1 --format="%H" -- lib/point.rb)
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start "$starting_commit" --end "$finishing_commit" --file lib/point.rb
}