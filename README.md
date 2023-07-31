# My neovim config

For linux clone under

``` 
~/.config
```

For windows clone under

```
 ~/AppData/Local
 ```

 ## Setup the addons via packer

Linux

 ```
 git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```

 Windows 

 ```
 git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
 ```

 Install the plugins from nvim:

 ```
 :PackerSync
 ```

 ## Some notes about Windows

 It appears that the current msi does not add a context menu entry. To change that 
 * go to ` HKEY_CURRENT_USER\SOFTWARE\Classes\*\shell `
 * Add a key called 'Open with Neovim'
     * (optional) Create a sz value called Icon and set it to `C:\Program Files\Neovim\bin\nvim-qt.exe`
 * Within add a key called 'command'
 * Edit the (default) value to ` "C:\Program Files\Neovim\bin\nvim-qt.exe" "%1" `

 [Reference](https://stackoverflow.com/questions/20449316/how-add-context-menu-item-to-windows-explorer-for-folders)


