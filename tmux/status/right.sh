#!/usr/bin/env bash

echo "#[fg=colour39,bg=colour234]\
#[fg=black,bg=colour39] Ѫ \
$(kubectl config get-contexts --no-headers | awk '/^\*/ {print $4 " : " $5}') \
#[fg=colour238,bg=colour39]#[fg=yellow,bg=colour238]\
$(uptime | awk -F: '{print $NF}') \
#[fg=colour252,bg=colour238]#[fg=colour235,bg=colour252] \
$(gdate "+%a %F %T %Z")"
