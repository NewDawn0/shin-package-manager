# shin
A universal package manager

### Table of contents
- General
- Installation
- Uninstallation
- Usage
- Dependencies
- Additional Info

## General
### Explanation
Shin is a general purpose package manager for my custom ndos packages as well as a wrapper for other package managers, so only one command is needed to do the package managing.

Explanation with examples: </br>
`shin install skyfetch` or `shin -i skyfetch`</br>
- On macOs</br>
Shin will search brew (homebrew) first,
if the package isn't found there Shin will proceed to the next package manager
which is in this case port (macPorts)
Shin will do this until all package managers are queried or one installs the package
- On ArchLinux</br>
Shin will search pacman first,
if the package isn't found there Shin will proceed to the next package manager
which is in this case yay or paru (AUR)
Shin will do this until all package managers are queried or one installs the package</br>

`shin install -p npm skyfetch` or `shin -ip npm skyfetch`</br>
Shin will only search the package with the named package manager which is in this example npm.


## Installation
```
git clone https://github.com/NewDawn0/shin.git
cd shin
./install.sh
