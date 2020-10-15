#!/usr/bin/env bash

target_dir=$HOME/dotfiles

exclude_pattern='^'$target_dir'/.git/.*$'

inotifywait -mrq --exclude $exclude_pattern --format '%w%f %e' --event create,delete,close_write $target_dir  | while read event
  do
      cd $target_dir && \
      git pull && \
      git add -A && \
      git commit -am "commit" && \
      git push
  done


