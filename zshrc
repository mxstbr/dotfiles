export ZSH=/Users/mxstbr/.oh-my-zsh

# Theme
ZSH_THEME="robbyrussell"

# Command auto-correction
ENABLE_CORRECTION="true"

# European date format
HIST_STAMPS="dd.mm.yyyy"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Syntax highlighting for command
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  

# Add stuff to the path
export PATH="$HOME/.homebrew/sbin:$HOME/.homebrew/bin:$PATH"
export PATH="$HOME/.ellipsis/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Homebrew options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Disable the automatic title
export DISABLE_AUTO_TITLE=true

# Set prompt, similar to Pure by Sindre Sorhus but much faster
local path_string="%{$fg[yellow]%}%~"
local prompt_symbol=$'\n'"❯" # Symbol stolen from Pure prompt
local return_status="%(?:%{$fg[blue]%}$prompt_symbol:%{$fg[red]%}$prompt_symbol)"
PROMPT=$'\n''${path_string} ${return_status} %{$reset_color%}'

# Install fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Make vim-tmux-navigator work with vim-fzf
# See https://github.com/junegunn/fzf.vim/issues/285
export FZF_DEFAULT_OPTS="--bind 'ctrl-j:ignore,ctrl-k:ignore'"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
