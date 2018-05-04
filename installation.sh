zen2_pyenv_dir="$HOME/.zen2"

if [ -e $zen2_pyenv_dir ]; then
    echo "$zen2_pyenv_dir already exists."
    echo "If $zen2_pyenv_dir is used for another program."
    echo "modify first line in zen2.sh and this installation script"
    echo "zen2_pyenv_dir=\"$HOME/.zen2\""
    echo "change it to a new directory"
    echo "then run this installation script again"
    exit 1
else
    echo "Creating '$zen2_pyenv_dir'"
    mkdir $zen2_pyenv_dir
fi

if [ -e "/usr/local/bin/zen2" ]; then
    echo "zen2 already exists in /usr/local/bin"
else
    cp $HOME/tools/zen/zen2.sh /usr/local/bin/zen2
fi

echo "You have to manually create alias"
echo "'alias zen2=\"source /usr/local/bin/zen2.sh\"'"
echo "in bash_profile, zshrc or .aliases"
echo "or something like the above."

unset zen2_pyenv_dir
