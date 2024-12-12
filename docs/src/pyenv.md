# Pyenv
pyenv lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.

## Installation

```shell
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
 
curl https://pyenv.run | bash
 
# Add this to the ~/.bashrc file:
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
```shell
# Verify proper operation by sourcing the bashrc and checking the version
exec $SHELL
pyenv --version
```

## Usage
Below are common usages for Pyenv and the associated commands.

### List python versions
The list of available python versions can be retrieved with the command:
```shell
pyenv install --list
```
The following command lists the python versions you have installed and are available to use:
```shell
pyenv versions
```

### Install a new python version
Once you find the python version you want to use, installing it is done with the following command:
```shell
pyenv install <version>
pyenv install 3.11.6
```

### Setting the python version in a project
Setting the python version can be done on a per project basis by creating a .python-version file in the root of your 
repository. The only contents of this file should be the python version, for example:  

.python-version
```text
3.11.6
```
Now if you type python from within the project root folder, you will get a python prompt with the version specified in 
the file.

### Setting global, local, and shell
You can also set the global python version, local version, and change your shell to a specific version. For more 
information on doing this see reference [2].

### Update Pyenv
If you do not see the python version you want to install it is likely you need to update Pyenv. Pyenv can be updated
with the following command:
```shell
pyenv update
```

## References
[1] https://maxat-akbanov.com/how-to-install-pyenv-python-version-manager-on-ubuntu-2004  
[2] https://realpython.com/intro-to-pyenv/  
[3] https://github.com/pyenv/pyenv