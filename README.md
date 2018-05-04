# **ZEN** - Zhiyan's python3 ENviroment manager

## Commands
* `zen`: list environments
* `zen dir`: prints the directory environments are stored in.
* `zen ENV_NAME`: Creates ENV_NAME if ENV_NAME does not exist, else uses it.
* `zen create ENV_NAME`: Creates ENV_NAME. Useful if you want to create an
  enviroment called list or dir.
* `zen new ENV_NAME`: Like *create* but uses environment afterwards.
* `zen remove ENV_NAME`: Removes environment.
* `zen use`: activates environment.

## Installation
The script will attempt the two following simple tasks.
* Create ".zen" directory in user's home folder. To change the default
  directory that zen uses, you have to change the line
  `zen_pyenv_dir="$HOME/.zen"` to whatever you prefer.
* copy zen to /usr/local/bin.

## Caveats

Because this is script needs to be run using `source`, it will overwrite the
following variables if they already defined in the shell session. But once the
script is run, it will unset all the following variables.

* zen_pyenv_dir
* zen_list
* zen_create
* zen_remove
* zen_use
* zen_use_else_create
* zen_new_env

## python2
See zen2 branch
