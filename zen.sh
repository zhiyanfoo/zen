zen_pyenv_dir="$HOME/.zen"
zen2_pyenv_dir="$HOME/.zen2"

zen_list() {
    if [ "$(ls -A $zen_pyenv_dir)" ]; then
        ls -1 $zen_pyenv_dir 
    else
        echo "No environments in $zen_pyenv_dir, to create one run 'zen MY_NEW_ENV'"
    fi
}

zen_help() {
    cat <<LimitString
usage: zen [ -h | --help] [<command>] [<env>] [virtualenv_options]

Most common operations.

  zen: list environments

  zen ENV_NAME [virtualenv_options]: Creates ENV_NAME if ENV_NAME does not
                                     exist, else uses it.

Other operations

  zen [-h | --help | help]: prints help

  zen create ENV_NAME [virtualenv_options]: Creates ENV_NAME

  zen dir: prints the directory environments are stored in

  zen new ENV_NAME [virtualenv_options]: Like *create* but uses the environment
                                         afterwards

  zen remove ENV_NAME: Removes environment

  zen use: activates environment.

  [virtualenv_options]: you can pass virtualenv options to zen and zen will
                        pass them down to the virtualenv it calls internally

                        Example:
                          zen create my_new_env --python 3.4

Once you are in an enviroment you can deactivate it using the command
deactivate (without zen prefixed) -- this a virtualenv command, not implemented
by zen.
LimitString
}

zen_create() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        echo "'$1' already exists as an environment"
    else
        echo Creating environment "'$1'"
        echo "$zen_new_env" ${@:2}
        virtualenv "$zen_new_env" ${@:2}
        echo "Finished creating environment"
    fi
    unset zen_new_env
}

zen_new() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        echo "'$1' already exists as an environment"
    else
        zen_create $@
        zen_use $1
    fi
    unset zen_new_env
}

zen_remove() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        rm -r $zen_new_env
        echo "Removed $1"
    else
        echo "Environment '$1' does not exist"
    fi
    unset zen_new_env
}

zen_use() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        source "$zen_new_env"/bin/activate
        echo "Using '$1'"
    else
        echo "Environment '$1' does not exist"
    fi
    unset zen_new_env
}

zen_use_else_create() {
    zen_new_env="$zen_pyenv_dir/$1"
    if [ -d $zen_new_env ]; then
        zen_use $1
    else
        zen_create $@
    fi
    unset zen_new_env
}

main() {
    if [ ! -d $zen_pyenv_dir ]; then
        echo "Creating '$zen_pyenv_dir'"
        mkdir $zen_pyenv_dir
    fi

    if [ $# -eq 0 ]; then
        zen_list
    elif [ "$1" = "list" ]; then
        zen_list
    elif [ "$1" = "dir" ]; then
        echo $zen_pyenv_dir
    elif [ "$1" = "-h" ] || [ "$1" = "--help" ] || [ "$1" = "help" ]; then
        zen_help
    elif [ "$1" = "create" ]; then
        zen_create ${@:2}
    elif [ "$1" = "new" ]; then
        zen_new ${@:2}
    elif [ "$1" = "remove" ]; then
        zen_remove $2
    elif [ "$1" = "use" ]; then
        zen_use $2
    else
        zen_use_else_create $@
    fi
}

zen_basename=$(basename "$0")

if [ $zen_basename = "zen" ]; then
    zen_pyenv_dir="$HOME/.zen"
elif [ $zen_basename = "zen2" ]; then
    zen_pyenv_dir="$HOME/.zen2"
else
    echo "Name of executable must be 'zen' or 'zen2'"
    echo "Currently it is '$zen_basename'"
    return 1
fi

main $@


unset zen_basename
unset zen_pyenv_dir
unset zen_pyenv_dir2
unset zen_list
unset zen_create
unset zen_remove
unset zen_use
unset zen_new
unset zen_use_else_create
