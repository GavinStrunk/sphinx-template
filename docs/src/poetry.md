# Poetry
Poetry is a tool for dependency management and packing. 

## Installation
```shell
curl -sSL https://install.python-poetry.org | python3 -

# Add this to the ~/.bashrc file:
# Poetry
export PATH="$HOME/.local/bin:$PATH"
```
```shell
# Verify with the version and add autocompletion
poetry --version
poetry completions bash >> ~/.bash_completion
```
## Usage

Packages can also be installed from Github directly and specify the version with the command:
```shell
poetry add git+https://github.com/sdispater/pendulum.git#2.0.5
```

## Troubleshooting
If you get the keyring error:
```shell
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
```

## References
[1] https://python-poetry.org/docs/