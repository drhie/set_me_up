#!bin/bash

if [ $2 == "vim" ]
then
 dotfile=".vimrc"
elif [ $2 == "tmux" ]
then
 dotfile=".tmux.conf"
elif [ $2 == "zsh" ]
then
 dotfile=".zshrc"
else
 echo "Unsupported dotfile" && exit 0
fi

if [ $1 == "import" ]
then
 read -s -p "This will overwrite your current $2 settings. Are you sure? [y/n]" prompt
 if [ $prompt == "y" ]
 then
   cp $DOTFILE_DIR/$dotfile $HOME/$dotfile
   echo "\r\nAll done!" && exit 0
 else
   echo "\r\nAborted" && exit 0
 fi
elif [ $1 == "export" ]
then
 read -s -p "This will update your repo's $2 dotfile with your current $2 settings. Are you sure? [y/n]" prompt
 if [ $prompt == "y" ]
 then
   cp $HOME/$dotfile $DOTFILE_DIR/$dotfile
   echo "\r\nAll done!" && exit 0
 else
   echo "\r\nAborted" && exit 0
 fi
else
  echo "Unsupported operation" && exit 0
fi
