# shin
"One to bind them all"</br>
Shin is a crosslatform package manager

## Supported Operating Systems
- Mac OS (OSX)
- Arch and [Arch based systems](https://wiki.archlinux.org/title/Arch-based_distributions#Active)
- Debian and [Arch based systems](https://distrowatch.com/search.php?basedon=Debian)


### Table of contents
- General
- Installation
- Uninstallation
- Usage
- Dependencies
- Additional Info

## General
### Explanation
Shin is a crossplatform package manager and wrapper for other platform managers</br>
Shin searches through every supported package manager on the system and will install the package</br>
meaning that only one install command is needed to install packages with different package managers</br>
But Shin also supports the option of choosing the package manager that the packages will be installed with </br>

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
chmod +x install.sh
./install.sh
