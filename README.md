# **ZEN** - Zhiyan's python ENviroment manager

Zen is an alternative virtualenvwrapper, with a simpler API.
You can get by with just one commands, `zen`.

## Commands

Most common operations.
* `zen`: list environments
* `zen ENV_NAME [virtualenv_options]`: Creates ENV_NAME if ENV_NAME does not exist, else uses it

Other operations

* `zen [-h | --help | help]`: prints help
* `zen create ENV_NAME [virtualenv_options]`: Creates ENV_NAME
* `zen dir`: prints the directory environments are stored in
* `zen new ENV_NAME` [virtualenv_options]: Like *create* but uses environment afterwards
* `zen remove ENV_NAME`: Removes environment
* `zen use`: activates environment

[virtualenv_options] you can pass virtualenv options to zen and zen will pass them down to
virtualenv it calls internally.

Example:
  zen create my_new_env --python 3.4

Once you are in an enviroment you can deactivate it using the command `deactivate` (without zen
prefixed) -- this a virtualenv thing.


## Important

zen must be run with `source` instead of directly, i.e. with `./`. So add the
following alias to your shell configuration file, e.g.
zshrc/bashrc/bash_profile.

`alias zen="source /usr/local/bin/zen"`

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
