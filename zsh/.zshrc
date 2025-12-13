# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added a config file for you to customize HyDE before loading zshrc
# Edit $ZDOTDIR/.user.zsh to customize HyDE before loading zshrc

#  Plugins 
# oh-my-zsh plugins are loaded  in $ZDOTDIR/.user.zsh file, see the file for more information

#  Aliases 
# Override aliases here in '$ZDOTDIR/.zshrc' (already set in .zshenv)

# # Helpful aliases
# alias c='clear'                                                        # clear terminal
# alias l='eza -lh --icons=auto'                                         # long list
# alias ls='eza -1 --icons=auto'                                         # short list
# alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
# alias ld='eza -lhD --icons=auto'                                       # long list dirs
# alias lt='eza --icons=auto --tree'                                     # list folder as tree
# alias un='$aurhelper -Rns'                                             # uninstall package
# alias up='$aurhelper -Syu'                                             # update system/package/aur
# alias pl='$aurhelper -Qs'                                              # list installed package
# alias pa='$aurhelper -Ss'                                              # list available package
# alias pc='$aurhelper -Sc'                                              # remove unused cache
# alias po='$aurhelper -Qtdq | $aurhelper -Rns -'                        # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
# alias vc='code'                                                        # gui code editor
# alias fastfetch='fastfetch --logo-type kitty'

# # Directory navigation shortcuts
# alias ..='cd ..'
# alias ...='cd ../..'
# alias .3='cd ../../..'
# alias .4='cd ../../../..'
# alias .5='cd ../../../../..'

# # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
# alias mkdir='mkdir -p'

#  This is your file 
# Add your configurations here
# export EDITOR=nvim
export EDITOR=code

# unset -f command_not_found_handler # Uncomment to prevent searching for commands not found in package manager
#

alias cd="z"
alias lg="lazygit"
alias ta="tmux attach"
alias sps="sudo pacman -S"
alias conz="nvim $ZDOTDIR/.zshrc"
alias sourcez="$ZDOTDIR/.zshrc"
alias hyprc="nvim $HOME/.config/hypr/keybindings.conf"
alias syu="sudo pacman -Syu"
alias cgit='eval "$(keychain --eval sahil-dsh)"'
alias pgit='eval "$(keychain --eval SahilDoshi03)"'
alias kgit='eval "$(keychain --eval kd)"'
alias crem='ssh-add -d ~/.ssh/sahil-dsh'
alias prem='ssh-add -d ~/.ssh/SahilDoshi03'
alias krem='ssh-add -d ~/.ssh/ks'
alias rs="docker run -d -p 6379:6379 redis"
alias syss="systemctl start"
alias sysr="systemctl reload"
alias syst="systemctl status"
alias startvenv="source venv/bin/activate"
alias startcore="uvicorn main:app --reload --host 0.0.0.0 --port 8000"
alias startbackend="source venv/bin/activate && uvicorn main:app --reload --host 0.0.0.0 --port 8000"

bindkey -s '^h' "tmux-sessionizer\n"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# zoxide
eval "$(zoxide init zsh)"

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/lspl370/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/lspl370/Desktop/projects/web-client/google-cloud-sdk/path.zsh.inc' ]; then . '/home/lspl370/Desktop/projects/web-client/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/lspl370/Desktop/projects/web-client/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/lspl370/Desktop/projects/web-client/google-cloud-sdk/completion.zsh.inc'; fi
source ~/google-cloud-sdk/path.zsh.inc
source ~/google-cloud-sdk/completion.zsh.inc
