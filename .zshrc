# Dynamic window title with zsh shell.
# Shows current directory and running (multi-line) command.
case "$TERM" in (alacritty)
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
alias ra="ranger"
alias ls="exa"
alias spt="/home/anas/code/scripts/spt.sh"
alias cat="bat"
alias grep="rg"
alias ps="procs"
alias du="dust"
alias find="fd"
alias awk="rargs"
# alias cd="z"
SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."
alias ytop="ytop -a -b -p -s"

# init zoxide
eval "$(zoxide init --cmd c --hook 'pwd' zsh)"

autoload zed
SAVEHIST=300
HISTFILE=~/.zsh_history
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files ~/.config ~/.vim ~/.vimbackup ~/.vimswap ~/.vimundo ~/.vimviews ~/code ~/Desktop ~/Documents ~/Downloads ~/IdeaProjects ~/org --hidden"
export PF_INFO="ascii title os host kernel uptime pkgs memory shell editor palette"
export GRAAL_PATH=/home/anas/graalvm/graalvm-ce-java11-20.1.0/bin:$PATH
# export LLVM_TOOLCHAIN=$(lli --print-toolchain-path)
