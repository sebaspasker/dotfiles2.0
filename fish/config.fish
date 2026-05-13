# VI mode
fish_vi_key_bindings

# PATH
fish_add_path /home/sebasp/.local/bin/
fish_add_path /nix/var/nix/profiles/default/bin
fish_add_path $HOME/.nix-profile/bin

# Aliases
alias pbpaste "xclip -selection clipboard -o"

# Zoxide
zoxide init fish | source

# Keybindings
source ~/.config/fish/keybind.fish

set -Ux CLAUDE_CODE_USE_OPENAI 1
set -Ux OPENAI_BASE_URL "http://localhost:11434/v1"
set -Ux OPENAI_MODEL "gemma4:e2b"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
