alias json="python -mjson.tool"
alias pubip='python -c "from json import load; from urllib2 import urlopen; print load(urlopen(\"http://httpbin.org/ip\"))[\"origin\"]"'

# find out possible orphan processes
alias show_ppid_one="ps -elf | head -1; ps -elf | awk '{if ($5 == 1) {print $0}}'"

# alias for leiningen
alias repl="tmux new-session -d -s repl 'lein repl'"
alias ling="tmux new-session -d -s ling 'lein ring server-headless'"
alias deps-shadow="clj -M:dev -m shadow.cljs.devtools.cli watch main"
alias deps-nrepl="clj -M:dev:cider-clj"

# alias for tmux
alias tmux='tmux -2'

# alias for pylint
alias pylint='autopep8 --in-place --aggressive'
