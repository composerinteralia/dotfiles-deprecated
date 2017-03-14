for DOTFILE in system/.{function,path,env,alias,prompt}
do
  [ -f "$DOTFILE" ] && source "$HOME/$DOTFILE"
done
