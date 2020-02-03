zen_pyenv_dir="$HOME/.zen"
zen_source_dir=$(dirname $0:h:P)

if [ -e $zen_pyenv_dir ]; then
    echo "$zen_pyenv_dir already exists."
    echo
else
    echo "Creating '$zen_pyenv_dir'"
    mkdir $zen_pyenv_dir
fi

if [ -e "/usr/local/bin/zen.sh" ]; then
    echo "zen.sh already exists in /usr/local/bin"
    echo
else
    echo "copying zen over to /usr/local/bin"
    cp "$zen_source_dir"/zen /usr/local/bin/zen.sh
fi

echo "You have to manually create alias"
echo "'alias zen=\"source /usr/local/bin/zen.sh\"'"
echo

unset zen_pyenv_dir

zen_pyenv_dir2="$HOME/.zen2"

if [ -e $zen_pyenv_dir2 ]; then
    echo "$zen_pyenv_dir2 already exists."
    echo
else
    echo "Creating '$zen_pyenv_dir2'"
    mkdir $zen_pyenv_dir2
fi

if [ -e "/usr/local/bin/zen2.sh" ]; then
    echo "zen2.sh already exists in /usr/local/bin"
    echo
else
    echo "copying zen2 over to local bin"
    cp "$zen_source_dir"/zen2 /usr/local/bin/zen2.sh
fi

echo "You have to manually create alias"
echo "'alias zen2=\"source /usr/local/bin/zen2.sh\"'"

unset zen_pyenv_dir2
unset zen_source_dir
