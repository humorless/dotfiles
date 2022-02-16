alias json="python -mjson.tool"
alias pubip='python -c "from json import load; from urllib2 import urlopen; print load(urlopen(\"http://httpbin.org/ip\"))[\"origin\"]"'
alias http='python3 -m http.server'
# find out possible orphan processes
alias show_ppid_one="ps -elf | head -1; ps -elf | awk '{if ($5 == 1) {print $0}}'"

# alias for leiningen
alias repl="tmux new-session -d -s repl 'lein repl'"
alias ling="tmux new-session -d -s ling 'lein ring server-headless'"

# alias for babashka
alias bbrepl="tmux new-session -d -s bbrepl 'bb nrepl-server 1667'"
# alias for clojure & deps.edn tool chain
alias drepl="tmux new-session -d -s drepl 'clj -M:dev:cider-clj'"
alias dfull="tmux new-session -d -s dfull 'clj -M:dev:shadow-cider-clj'"
alias dshadow="tmux new-session -d -s dshadow 'clj -M:shadow-cljs watch main'"
# maybe this can be used in fullstack developing

# alias for tmux
alias tmux='tmux -2'

# alias for pylint
alias pylint='autopep8 --in-place --aggressive'
