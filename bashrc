fzf_project_search() {
    local dir
    dir=$(find ~ -type d 2>/dev/null | fzf --preview 'ls -l {}' --height 100%)
    if [ -n "$dir" ]; then
	cd "$dir"
	local base_dir=$(basename "$dir")
	tmux new -As "$base_dir"
    fi
}

fzf_file_search() {
    local file
    file=$(find ~ -type f 2>/dev/null | fzf --preview 'ls -l {}' --height 100%)
    if [ -n "$file" ]; then
	nvim "$file"
    fi
}

bind -x '"\C-f": fzf_project_search'
bind -x '"\C-e": fzf_file_search'
alias '..'='cd ..'
