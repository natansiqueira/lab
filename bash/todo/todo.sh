#!/usr/bin/env bash

# consts
TODO_DIR="$HOME/.local/share/todo"
TODO_FILE="$TODO_DIR/todos"

# utils
_have() {
	type "$1" &>/dev/null
}

# dependencies
! _have fzf && echo "→ fzf required" && exit 1
! [[ -d $TODO_DIR ]] && mkdir -p $TODO_DIR && touch $TODO_FILE && echo "→ todo list started ($TODO_FILE)"

new() {
  	echo "→ $*" >>$TODO_FILE
	echo "✓ task added"
}

list() {
	if [ "$1" = "all" ]; then
		[[ $(cat $TODO_FILE | wc -l | xargs) -eq 0 ]] && echo '→ no entries' && exit 0
		cat $TODO_FILE
		echo "✓ total items $(cat $TODO_FILE | wc -l | xargs)"
	else
		tasks=$(cat $TODO_FILE | grep "→" | wc -l | xargs)
		[[ $tasks -eq 0 ]] && echo '→ no entries' && exit 0
		cat $TODO_FILE | grep "→"
		echo "✓ total items $tasks"
	fi
}

completed() {
	task=$(cat $TODO_FILE | fzf --height=15 --border --reverse -e -i --tiebreak=begin --prompt='Task: ')
	! [[ -n $task ]] && echo '→ operation cancelled' && exit 1
	replacement=$(echo "$task" | gsed 's/→/✓/')
	gsed -i "s/$task/$replacement/" "$TODO_FILE"
	echo "✓ $task mark as completed"
}

delete() {
	[[ $(cat $TODO_FILE | wc -l | xargs) -eq 0 ]] && echo '→ no entries' && exit 0
	task=$(cat $TODO_FILE | fzf --height=15 --border --reverse -e -i --tiebreak=begin --prompt='Task: ')
	! [[ -n $task ]] && echo '→ operation cancelled' && exit 1
	gsed -i "/$task/d" "$TODO_FILE"
	echo "✓ task deleted"
}

help() {
	echo "todo - simple todo"
	echo
	echo "Syntax: zet -[n|new|l|list|c|completed|h]"
	echo "options:"
	echo "n | new [title]	new todo entry"
	echo "l | list			list active tasks"
	echo "			all		list tasks including completed"
  	echo "c | comp			mark todo as completed"
	echo "d | del			delete a task"
	echo "h | help        	print this help"
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
  	c | comp)
    	completed
    	exit
    ;;
	d | del)
    	delete
    	exit
    ;;
 	*)
    	help
    	exit
    ;;
esac
