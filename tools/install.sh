EMACSD="$HOME/.emacs.d"
if [ -e $EMACSD ]
then
  echo "You already have Oh My Emacs installed. You'll need to remove $EMACSD if you want to install"
  exit
fi

OH_MY_DIR="$HOME/.oh-my-emacs"
echo "Cloning Oh My Emacs..."
/usr/bin/env git clone git://github.com/hvrauhal/oh-my-emacs.git $OH_MY_DIR

DOT_CONFIG="$HOME/.emacs"
echo "Looking for an existing emacs config..."
if [ -f $DOT_CONFIG ] || [ -h $DOT_CONFIG ]
then
  echo "Found ~/$DOT_CONFIG. Backing up to ~/$DOT_CONFIG.pre-oh-my-emacs";
  cp $DOT_CONFIG $DOT_CONFIG.pre-oh-my-emacs;
  rm $DOT_CONFIG;
fi

echo "Using the Oh My Emacs template file and adding it to $DOT_CONFIG"
ln -s $OH_MY_DIR/templates/emacs-template $DOT_CONFIG
ln -s $OH_MY_DIR/.emacs.d $EMACSD

echo "Oh My Emacs is now installed."
