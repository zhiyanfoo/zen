# **ZEN** - Zhiyan's python ENviroment manager

Zen is an alternative virtualenvwrapper, with a simpler API.
You can get by with just one commands, `zen`.

<p align="center"><img src="/img/usage.gif?raw=true"/></p>

## Commands

Most common operations.
* `zen`: list environments
* `zen ENV_NAME`: Creates ENV_NAME if ENV_NAME does not exist, else uses it

Other operations

* `zen [-h | --help | help]`: prints help
* `zen create ENV_NAME`: Creates ENV_NAME
* `zen dir`: prints the directory environments are stored in
* `zen new ENV_NAME` : Like *create* but uses environment afterwards
* `zen remove ENV_NAME`: Removes environment
* `zen use`: activates environment

Once you are in an enviroment you can deactivate it using the command `deactivate` (without zen
prefixed) -- this a virtualenv thing.


## Installation

# Example installation steps

```
git clone https://github.com/zhiyanfoo/zen.git zen
cd zen
./installation.sh
echo 'alias zen="source /usr/local/bin/zen.sh"' >> $HOME/.bash_profile
```

# Notes

zen must be run with `source` instead of directly, i.e. with `./`.
Which is why we add the following alias to your shell configuration file, e.g.
zshrc/bashrc/bash_profile.

`alias zen="source /usr/local/bin/zen.sh"`

The script will attempt the two following simple tasks.
* Create ".zen" directory in user's home folder. To change the default
  directory that zen uses, you have to change the line
  `zen_pyenv_dir="$HOME/.zen"` to whatever you prefer.
* copy zen to /usr/local/bin.
