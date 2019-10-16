#!/usr/bin/env bash

# Display values
aws_role="$(awk '{print $1}'<~/.aws/current_default 2>/dev/null)"
aws_token_validity="$([[ $(($(gdate -d $(awk '{print $2}'<~/.aws/current_default) +"%s") - $(gdate +"%s"))) < 0 ]] && echo "[X]" || echo "[✓]")"
kube_context="$(kubectl config get-contexts --no-headers | awk '/^\*/ {print $2 ":" $5}')"
load="$(uptime | awk -F: '{print $NF}')"
date="$(gdate "+%a %F %T %Z")"

# Formatting codes
_purple_on_black='#[fg=colour89,bg=colour234]'
_yellow_on_purple='#[fg=yellow,bg=colour89]'
_blue_on_purple='#[fg=colour39,bg=colour89]'
_black_on_blue='#[fg=colour234,bg=colour39]'
_yellow_on_black='#[fg=yellow,bg=colour234]'
_grey_on_black='#[fg=colour252,bg=colour234]'
_black_on_grey='#[fg=colour234,bg=colour252]'

# OUTPUTS:
# AWS Information
echo -n "${_purple_on_black}${_yellow_on_purple} AWS » ${aws_role} ${aws_token_validity} "
# Kubernetes Information
echo -n "${_blue_on_purple}${_black_on_blue} k8s » ${kube_context} "
# System Load
echo -n "${_yellow_on_black}${load} "
# System Date / Time
echo -n "${_grey_on_black}${_black_on_grey} ${date}"
