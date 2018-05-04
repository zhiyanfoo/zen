# **ZEN2** - Zhiyan's python2 ENviroment manager

## Commands
* `zen2`: list environments
* `zen2 dir`: prints the directory environments are stored in.
* `zen2 ENV_NAME`: Creates ENV_NAME if ENV_NAME does not exist, else uses it.
* `zen2 create ENV_NAME`: Creates ENV_NAME. Useful if you want to create an
  enviroment called list or dir.
* `zen2 new ENV_NAME`: Like *create* but uses environment afterwards.
* `zen2 remove ENV_NAME`: Removes environment.
* `zen2 use`: activates environment.

## Installation
The script will attempt the two following simple tasks.
* Create ".zen2" directory in user's home folder. To change the default
  directory that zen2 uses, you have to change the line
  `zen2_pyenv_dir="$HOME/.zen2"` to whatever you prefer.
* copy zen2 to /usr/local/bin.

## Caveats

Because this is script needs to be run using `source`, it will overwrite the
following variables if they already defined in the shell session. But once the
script is run, it will unset all the following variables.

* zen2_pyenv_dir
* zen2_list
* zen2_create
* zen2_remove
* zen2_use
* zen2_use_else_create
* zen2_new_env
