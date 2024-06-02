# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias h="history"
alias t="/Users/luutuankiet/config-backups/ticktask_new $*"
# Dependencies: fzf, awk, bat, tr

fman() {
    	man -k . |
		fzf --exact -q "$1" --prompt='man> '  --preview $'echo {} |
		tr -d \'()\' |
		awk \'{printf "%s ", $2} {print $1}\' |
		xargs -r man |
		col -bx |
		bat -l man -p --color always'|
		tr -d '()' | awk '{printf "%s ", $2} {print $1}' |
		xargs -r man
}
# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"


# sets 
unset MANPAGER

# for leetcode
alias leetcode="docker run --rm -e POSTGRES_PASSWORD=5432 -p 5432:5432 -d postgres"

# Created by `pipx` on 2024-04-10 07:09:14
export PATH="$PATH:/Users/luutuankiet/.local/bin"
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/luutuankiet/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/luutuankiet/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/luutuankiet/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/luutuankiet/google-cloud-sdk/completion.zsh.inc'; fi


function remote() {
    local user=${1:-ken}
    local host=${2:-dell}
    local dir=${3:-dev}

    local remote_uri="vscode-remote://ssh-remote+${user}@${host}/home/${user}/${dir}"

    eval "code --folder-uri \"${remote_uri}\""
		echo "remote to \"${remote_uri}\"..."
}



function cleanup_docker {
  # Prune Docker system
  sudo docker system prune -a -f || echo "Failed to prune Docker system"

  # Remove exited containers
  containers=$(sudo docker ps -a -q -f status=exited)
  if [ -n "$containers" ]; then
    sudo docker rm -v $containers || echo "Failed to remove exited containers"
  else
    echo "No exited containers to remove"
  fi

  # Remove dangling images
  images=$(sudo docker images -f "dangling=true" -q)
  if [ -n "$images" ]; then
    sudo docker rmi -f $images || echo "Failed to remove dangling images"
  else
    echo "No dangling images to remove"
  fi
}
