![Preview Image 1](images/nvim-banner.webp)
## Personal Neovim Configuration
This is my personal Neovim configuration and keybinds for personal use.
If you are new to Neovim, it is heavily encouraged to not copy my configuration files as these configurations are tailored to my personal workflow.  
Color Scheme is based off Catppuccin. [Original Github Repository is here](https://github.com/catppuccin/nvim)  

It is *strongly recommended* that you learn to make your own Neovim configuration instead of copying mine, as all keybinds and configurations are programmed to suit my own workflow.  


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
