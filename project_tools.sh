#!/bin/bash
function change_frequency() {
  git log --name-only --date=short --format=format: --no-renames --after=2024-01-01 | egrep -v '^$' | sort | uniq -c | sort -r
}

function complexity() {
  cloc . --by-file --not-match-d='.*\.idea.*'
}