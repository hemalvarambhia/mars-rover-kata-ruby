#!/bin/bash
function change_frequency() {
  date="$1"
  git log --name-only --date=short --format=format: --no-renames --after="$date" | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}