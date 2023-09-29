
# O-Crypt

Encrypt and decrypt text with openssl (aes-256)

## Prerequisit

- Open SSL


## Installation

Using the [Homebrew](https://brew.sh/) package manager.

```zsh
brew tap frixxx/tap
brew install o-crypt
```
## Usage/Examples

```shell
o-crypt encrypt -p <password> <input>
o-crypt decrypt -p <password> <encrypted-input>
```


## Environment Variables

Instead of using the password option you can set a global environment variable in your .zshrc file and ommit the `-p` option.

`OCRYPT_PASSPHRASE`


## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  
