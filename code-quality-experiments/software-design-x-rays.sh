#!/bin/bash
function change_frequency() {
  local date="${1:-2024-01-01}"

  git log --name-only --date=short --format=format: --no-renames --after="$date" | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}

function complexity_trend() {
  local ruby_script=$1
  starting_commit=$(git log --format="%H" --diff-filter=A -- "$ruby_script")
  finishing_commit=$(git log -1 --format="%H" -- "$ruby_script")
  python3 ~/projects/maat-scripts/miner/git_complexity_trend.py --start "$starting_commit" --end "$finishing_commit" --file "$ruby_script"
}

function proximity_analysis() {
  local ruby_script=$1
  starting_commit=$(git log --format="%H" --diff-filter=A -- "$ruby_script")
  finishing_commit=$(git log -1 --format="%H" -- "$ruby_script")
  python3 ~/projects/maat-scripts/miner/git_proximity_analysis.py --start "$starting_commit" --end "$finishing_commit"
}
