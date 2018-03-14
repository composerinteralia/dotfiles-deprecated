for DOTFILE in $HOME/system/.{function,env,alias,prompt}; do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done

ensure_tmux_is_running
