zen_pyenv_dir="$HOME/.zen"

if [ -e $zen_pyenv_dir ]; then
    echo "$zen_pyenv_dir already exists."
    echo "If $zen_pyenv_dir is used for another program."
    echo "modify first line in zen.sh and this installation script"
    echo "zen_pyenv_dir=\"$HOME/.zen\""
    echo "change it to a new directory"
    echo "then run this installation script again"
    exit 1
else
    echo "Creating '$zen_pyenv_dir'"
    mkdir $zen_pyenv_dir
fi

if [ -e "/usr/local/bin/zen" ]; then
    echo "zen already exists in /usr/local/bin"
else
    cp zen.sh /usr/local/bin/zen
fi

echo "You have to manually create alias"
echo "'alias zen=\"source /usr/local/bin/zen.sh\"'"
echo "in bash_profile, zshrc or .aliases"
echo "or something like the above."

unset zen_pyenv_dir
