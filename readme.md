## Personal Neovim Configuration
This is my personal Neovim configuration and keybinds for personal use.
If you are new to Neovim, it is heavily encouraged to not copy my configuration files as these configurations are tailored to my personal workflow.

### Preview Screens

| ![Preview Image 1](images/preview1.png) | 
|:--:| 
| *Preview 1* |

| ![Preview Image 2](images/preview2.png) | 
|:--:| 
| *Preview 2* |

| ![Preview Image 3](images/preview3.png) | 
|:--:| 
| *Preview 3* |

### Issues and Fixes
#### Clipboard is not working on linux
Remember to install xclip on x11 with Pacman
```shell
pacman -S xclip
```
For Wayland
```shell
pacman -S wl-clipboard 
```

#### C and C++ Compiler issues on Windows
Install gcc with Scoop
```shell
scoop install gcc
```
