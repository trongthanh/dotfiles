# Package management
alias addrepo="sudo apt-add-repository"
alias update="sudo apt update && sudo apt list --upgradable"
alias upgrade="sudo apt -qq update && sudo apt upgrade"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias search="apt-cache search"

# Quick CD
alias ..="cd .."
alias ...="cd ../.."

# For Sublime Text, install with Ubuntu/Debian PPA, it will create alias for
# subl

# be nice
alias pl=sudo
alias hosts='sudo subl /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

# List only directories
alias lsd='ll | grep "^d"'

# Some remove conveniences
alias rmr='rm -r'
alias rmf='rm -f'

# `cat` with beautiful colors. requires Pygments installed.
# 							   sudo easy_install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | grep" # NOT WORKING, use ips instead
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net" #NOT WORKING, whois is not install by default

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Clean up node_modules folders
alias npmcleanup="find . -name 'node_modules' -type d -exec rm -rfv '{}' +"

# File size
alias fs="stat -f \"%z bytes\""

# find shorthand
function f() {
    find . -name "$1"
}

# Extract archives - use: extract <file>
# Credits to http://dotfiles.org/~pseup/.bashrc
# TODO: to test
function extract() {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xjf $1 ;;
			*.tar.gz) tar xzf $1 ;;
			*.bz2) bunzip2 $1 ;;
			*.rar) rar x $1 ;;
			*.gz) gunzip $1 ;;
			*.tar) tar xf $1 ;;
			*.tbz2) tar xjf $1 ;;
			*.tgz) tar xzf $1 ;;
			*.zip) unzip $1 ;;
			*.Z) uncompress $1 ;;
			*.7z) 7z x $1 ;;
			*) echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Start an HTTP server from a directory, optionally specifying the port
# TODO: to test
function server() {
	local port="${1:-8000}"
	open "http://localhost:${port}/"
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# nodejs command
alias n="npm"
alias ns="npm start"
alias y="yarn"
alias ys="yarn start"
alias serve="live-server"


# Vim command
alias v="vim"

# Terminal
alias cls="echo -ne '\033c'"
alias open="gnome-open"

# Tizonia
alias ti="tizonia"
alias tistr="tizonia --spotify-tracks"
alias tisar="tizonia --spotify-artist"
alias tisal="tizonia --spotify-album"
alias tispl="tizonia --spotify-owner 1189203964 --spotify-playlist"
function tisop() {
	#tiop spotify sleep
	tizonia --spotify-owner "$1" --spotify-playlist "$2"
}

alias tiyst="tizonia --youtube-audio-stream"
alias tiypl="tizonia --youtube-audio-playlist"
alias tiymi="tizonia --youtube-audio-mix"
alias tiyse="tizonia --youtube-audio-search"
alias tiyms="tizonia --youtube-audio-mix-search"
alias tiycp="tizonia --youtube-audio-channel-playlist"

alias tigtr="tizonia --gmusic-tracks"
alias tigar="tizonia --gmusic-artist"
alias tigal="tizonia --gmusic-album"
alias tigpl="tizonia --gmusic-playlist"
