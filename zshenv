export PATH=/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/texbin:~/bin:/usr/bin:/bin

# System-specific config
if [[ -f "$HOME/.zshenv.local" ]]; then
    source $HOME/.zshenv.local
fi
