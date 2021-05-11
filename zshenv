# Noob note: .zshenv -> [.zprofile if login] -> [.zshrc if interactive] -> [.zlogin if login] -> [.zlogout sometimes]

# ~Helpful aliases
alias l="ls -la"
alias vi="vim"
alias f="find . -name"
alias shasum="shasum -a 256"
alias cdgit='git rev-parse --show-toplevel 2>&1 >/dev/null && cd $(git rev-parse --show-toplevel)' # single so it's not interpolated
alias help="man zshbuiltins"
alias genpub="ssh-keygen -y -f"
alias grep="grep -v grep | grep"
alias md5sum="md5"
alias k="kubectl"

alias mosh='mosh -6'

# begin git aliases
alias gs="git status"
alias ga="git add"
alias gl="git log"
alias gd="git diff"
alias gdh="git diff HEAD"
alias git-rm-merged="git branch --merged | egrep -v \"(^\*|master)\" | xargs git branch -d"
# end git aliases

mkcd() {
  dir="$*"
  mkdir -p "$dir" && cd "$dir"
}

# for machine specific configuration
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

# begin PATH manipulation
# export PATH="$HOME/homebrew/bin:$PATH"
# export PATH="$HOME/homebrew/sbin:$PATH"
# export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# end PATH manipulation
