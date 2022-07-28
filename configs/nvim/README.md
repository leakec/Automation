# Coc install and packages
* `:PackerCompile` followed by `PackerInstall` to install coc
* `sudo apt install npm` - NPM manager to install plugins
* `:CocInstall coc-pyright` - Python support
  * `:CocCommand pyright.setInterpreter /usr/bin/python`
* `:CocInstall coc-ccls` - C++ support
  * `cd ~/.config/coc/extensions/node_modules/coc-ccls`
  * `npm i`
    * May need `npm install yarn`
  * `npm run build`
  * `npm audit fix --force`
