export ZSH="$HOME/.oh-my-zsh"

# for scripts
export PATH="$HOME/.local/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias cd="z"
alias lg="lazygit"
alias ta="tmux attach"
alias sps="sudo pacman -S"
alias conz="nvim ~/.zshrc"
alias sourcez="source ~/.zshrc"
alias hyprc="nvim $HOME/.config/hypr/hyprland.conf"
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
export PNPM_HOME="/home/sahil/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
