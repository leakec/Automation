# Install packages via packer
* `:PackerCompile` followed by `PackerInstall` to install coc

# Coc install and packages
* `sudo apt install npm` - NPM manager to install plugins
* `:CocInstall coc-pyright` - Python support
  * `:CocCommand pyright.setInterpreter /usr/bin/python`
* `:CocInstall coc-pydocstring` - Python docstring support
* `:CocInstall coc-ccls` - C++ support
  * `cd ~/.config/coc/extensions/node_modules/coc-ccls`
  * `npm i`
    * May need `npm install yarn`
  * `npm run build`
  * `npm audit fix --force`

# Treesitter install and packages
* `:TSInstall python`

