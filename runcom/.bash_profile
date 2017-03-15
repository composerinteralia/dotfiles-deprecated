for DOTFILE in $HOME/system/.{function,path,env,alias,prompt}; do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done
