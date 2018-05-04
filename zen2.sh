zen2_pyenv_dir="$HOME/.zen2"

zen2_list() {
    if [ "$(ls -A $zen2_pyenv_dir)" ]; then
        ls -1 $zen2_pyenv_dir 
    else
        echo "No environment in $zen2_pyenv_dir, to create one run 'zen2 MY_NEW_ENV'"
    fi
}

zen2_create() {
    zen2_new_env="$zen2_pyenv_dir/$1"
    if [ -d $zen2_new_env ]; then
        echo "'$1' already exists as an environment"
    else
        echo Creating environment "'$1'"
        virtualenv "$zen2_new_env"
        echo "Finished creating environment"
    fi
    unset zen2_new_env
}

zen2_new() {
    zen2_new_env="$zen2_pyenv_dir/$1"
    if [ -d $zen2_new_env ]; then
        echo "'$1' already exists as an environment"
    else
        echo Creating environment "'$1'"
        virtualenv "$zen2_new_env"
        echo "Finished creating environment"
        zen2_use $1
    fi
    unset zen2_new_env
}

zen2_remove() {
    zen2_new_env="$zen2_pyenv_dir/$1"
    if [ -d $zen2_new_env ]; then
        rm -r $zen2_new_env
        echo "Removed $1"
    else
        echo "Environment '$1' does not exist"
    fi
    unset zen2_new_env
}

zen2_use() {
    zen2_new_env="$zen2_pyenv_dir/$1"
    if [ -d $zen2_new_env ]; then
        source "$zen2_new_env"/bin/activate
        echo "Using '$1'"
    else
        echo "Environment '$1' does not exist"
    fi
    unset zen2_new_env
}

zen2_use_else_create() {
    zen2_new_env="$zen2_pyenv_dir/$1"
    if [ -d $zen2_new_env ]; then
        zen2_use $1
    else
        zen2_create $1
    fi
    unset zen2_new_env
}

if [ ! -d $zen2_pyenv_dir ]; then
    echo "Creating '$zen2_pyenv_dir'"
    mkdir $zen2_pyenv_dir
fi

if [ $# -eq 0 ]; then
    zen2_list
elif [ $# -eq 1 ]; then
    if [ "$1" = "zen2_list" ]; then
        zen2_list
    elif [ "$1" = "dir" ]; then
        echo $zen2_pyenv_dir
    else
        zen2_use_else_create $1
    fi
elif [ $# -eq 2 ]; then
    if [ "$1" = "create" ]; then
        zen2_create $2
    elif [ "$1" = "new" ]; then
        zen2_new $2
    elif [ "$1" = "remove" ]; then
        zen2_remove $2
    elif [ "$1" = "use" ]; then
        zen2_use $2
    else
        echo "Invalid arguments '$1 $2'"
    fi
fi

unset zen2_pyenv_dir
unset zen2_list
unset zen2_create
unset zen2_remove
unset zen2_use
unset zen2_new
unset zen2_use_else_create
