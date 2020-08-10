# Dynamic window title with zsh shell.
# Shows current directory and running (multi-line) command.
case "$TERM" in (kitty)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '[%c]')"
      term_title "$DIR" "zsh"
    }
    preexec () {
      local DIR="$(print -P '[%c]')"
      local CMD="${(j:\n:)${(f)1}}"
      term_title "$DIR" "$CMD"
    }
  ;;
esac


/home/anas/greeter.sh

# zplug
source ~/.zplug/init.zsh

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "zdharma/fast-syntax-highlighting"

zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-history-substring-search"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
# end

bindkey -v
alias clear="clear && /home/anas/greeter.sh"
alias n="nvim"
alias ni='nvim $(fzf)'
alias e='swallow emacs $(fzf)'
alias ra="ranger"
alias ri='ranger $(fd --type d --exclude "{.cache/*,anaconda3/*,.wine/*,.emacs.d*/*}" --color never --hidden | fzf)'
alias gl="glances"
alias l="exa"
alias ll="exa -l -G"
alias la="exa -a -l -G"
alias spt="/home/anas/code/scripts/spt.sh"
alias cat="bat"
alias grep="rg"
alias ps="procs"
alias du="dust"
alias find="fd"
alias m="cmus"
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias serve="browser-sync start --server --files"

# init zoxide
eval "$(zoxide init --cmd c --hook 'pwd' zsh)"

autoload zed
SAVEHIST=300
HISTFILE=~/.zsh_history
export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:$HOME/.local/bin/scripts
export PATH=$PATH:$HOME/.config/sway/scripts
export PAGER=less
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files ~/.config ~/.vim ~/code ~/Desktop ~/Documents ~/Downloads ~/IdeaProjects ~/org --hidden"
export ANDROID_SDK_ROOT=/home/anas/Android/Sdk
export ANDROID_HOME=/home/anas/.android/

