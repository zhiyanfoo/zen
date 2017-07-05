zen_pyenv_dir="$HOME/.zen"

zen_list() {
    if [ "$(ls -A $zen_pyenv_dir)" ]; then
        ls -1 $zen_pyenv_dir 
    else
        echo "No environment in $zen_pyenv_dir, to create one run 'zen MY_NEW_ENV'"
    fi
}

zen_create() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $new_env ]; then
        echo "'$1' already exists as an environment."
    else
        echo Creating environment "'$1'".
        python3 -m venv "$zen_new_env"
        echo "Finished creating environment."
    fi
    unset zen_new_env
}

zen_new() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $new_env ]; then
        echo "'$1' already exists as an environment."
    else
        echo Creating environment "'$1'".
        python3 -m venv "$zen_new_env"
        echo "Finished creating environment."
        zen_use $1
    fi
    unset zen_new_env
}

zen_remove() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        rm -r $zen_new_env
        echo "Removed $1."
    else
        echo "Environment '$1' does not exist."
    fi
    unset zen_new_env
}

zen_use() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        source "$zen_new_env"/bin/activate
        echo "Using '$1'."
    else
        echo "Environment '$1' does not exist."
    fi
    unset zen_new_env
}

zen_use_else_create() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        zen_use $1
    else
        zen_create $1
    fi
    unset zen_new_env
}

if [ ! -d $zen_pyenv_dir ]; then
    echo "Creating '$zen_pyenv_dir'"
    mkdir $zen_pyenv_dir
fi

if [ $# -eq 0 ]; then
    zen_list
elif [ $# -eq 1 ]; then
    if [ "$1" = "zen_list" ]; then
        zen_list
    elif [ "$1" = "dir" ]; then
        echo $zen_pyenv_dir
    else
        zen_use_else_create $1
    fi
elif [ $# -eq 2 ]; then
    if [ "$1" = "create" ]; then
        zen_create $2
    elif [ "$1" = "new" ]; then
        zen_new $1
    elif [ "$1" = "remove" ]; then
        zen_remove $2
    elif [ "$1" = "use" ]; then
        zen_use $1
    else
        echo "Invalid arguments '$1 $2'"
    fi
fi

unset zen_pyenv_dir
unset zen_list
unset zen_create
unset zen_remove
unset zen_use
unset zen_new
unset zen_use_else_create
