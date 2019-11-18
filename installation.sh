zen_pyenv_dir="$HOME/.zen"

if [ -e $zen_pyenv_dir ]; then
    echo "$zen_pyenv_dir already exists."
    echo "If $zen_pyenv_dir is used for another program."
    echo "modify first line in zen.sh and this installation script"
    echo "zen_pyenv_dir=\"$HOME/.zen\""
    echo "change it to a new directory"
    echo "then run this installation script again"
else
    echo "Creating '$zen_pyenv_dir'"
    mkdir $zen_pyenv_dir
fi

if [ -e "/usr/local/bin/zen.sh" ]; then
    echo "zen.sh already exists in /usr/local/bin"
else
    echo "copying zen over to /usr/local/bin"
    SOURCE=$(dirname $0:h:P)
    cp "$SOURCE"/zen /usr/local/bin/zen.sh
fi

echo "You have to manually create alias"
echo "'alias zen=\"source /usr/local/bin/zen.sh\"'"
echo "in bash_profile, zshrc or .aliases"
echo "or something like the above."

unset zen_pyenv_dir

zen_pyenv_dir2="$HOME/.zen2"

if [ -e $zen_pyenv_dir2 ]; then
    echo "$zen_pyenv_dir2 already exists."
    echo "If $zen_pyenv_dir2 is used for another program."
    echo "modify first line in zen.sh and this installation script"
    echo "zen_pyenv_dir2=\"$HOME/.zen2\""
    echo "change it to a new directory"
    echo "then run this installation script again"
else
    echo "Creating '$zen_pyenv_dir2'"
    mkdir $zen_pyenv_dir2
fi

if [ -e "/usr/local/bin/zen2.sh" ]; then
    echo "zen2.sh already exists in /usr/local/bin"
else
    echo "copying zen2 over to local bin"
    SOURCE=$(dirname $0:h:P)
    cp "$SOURCE"/zen2 /usr/local/bin/zen2.sh
fi

echo "You have to manually create alias"
echo "'alias zen2=\"source /usr/local/bin/zen2.sh\"'"
echo "in bash_profile, zshrc or .aliases"
echo "or something like the above."

unset zen_pyenv_dir2
