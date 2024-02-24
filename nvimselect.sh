#!/bin/bash

alias nvim-default="NVIM_APPNAME= nvim"
alias nvim-kick="NVIM_APPNAME= kicknvim nvim"

nvims() {
	items=("default" "kicknvim")
	choice=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config >> " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $choice ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $choice == "default" ]]; then
		choice=""
	fi
	NVIM_APPNAME=$choice nvim "$@"
}
