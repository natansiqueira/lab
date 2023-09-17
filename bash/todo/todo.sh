#!/usr/bin/env bash

# consts
TODO_FILE=".todos"

# utils
_have() {
	type "$1" &>/dev/null
}

# dependencies
! _have fzf && echo "→ fzf required" && exit 1

new() {
	echo "→ $*" >>$TODO_FILE
}

list() {
	if [ "$1" = "all" ]; then
		cat $TODO_FILE
	else
		[[ $(cat $TODO_FILE | grep "→" | wc -l | xargs) -eq 0 ]] && echo '→ no entries' && exit 0
		cat $TODO_FILE | grep "→"
	fi
}

complete() {
	task=$(cat $TODO_FILE | fzf)
	replacement=$(echo "$task" | gsed 's/→/✓/')
	gsed -i "s/$task/$replacement/" "$TODO_FILE"
}

help() {
	echo "todo - simple todo"
	echo
	echo "Syntax: zet -[n|new|l|list|c|complete|h]"
	echo "options:"
	echo "n | new [title] new todo entry"
	echo "l | list        list todos"
	echo "          all   list all"
	echo "h | help        print this help"
	echo
}

case "$1" in
  n | new)
    new "${@:2}"
    exit
    ;;
  l | list)
    list "$2"
    exit
    ;;
  c | complete)
    complete
    exit
    ;;
  *)
    help
    exit
    ;;
esac
