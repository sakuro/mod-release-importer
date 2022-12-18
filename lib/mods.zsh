#!/bin/zsh

typeset -A repos

OLD_IFS="$IFS"
IFS="|"
sed -n -e '3,$p' name-map.md | while read -A; do
  repo_name="$(tr -d " " <<<${reply[2]})"
  mod_name="$(tr -d " " <<<${reply[3]})"
  repos[$mod_name]=$repo_name
done
IFS="$OLD_IFS"

function repo_name()
{
  local mod_name="$1"
  echo "${repos[${mod_name}]}"
}

function file_name()
{
  local mod_name="$1"
  local version="$2"
  echo "${mod_name}_${version}.zip"
}
