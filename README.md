Python-vim
==========================


### Introduction ###
Python-vim can build a vim-plugin-based environment for python. It will install and configure YouCompleteMe and some other plugins.<br>
It allows you to search and replace words, comment and uncomment codes.<br>
It allows you to jump to definition recusively.<br>
It allows you to format codes with `autopep8`.


### Tested OS list
Ubuntu 16.04<br>
Ubuntu 18.04<br>
CentOS 7


### Installation ###
Python-vim supports only vim 8.<br>
Execute `./check.sh` to check if the environment is suitable for the installation.<br>
Execute `./install.sh` to do the installation.


##### Issues #####
NA


### General Usage ###
Execute `source ~/.bashrc` after the installation to make `vimc` work.<br>
To start a go project, execute `vimc` at the root of the project.<br>

`:Q<CR>`: quit vim and all plugins<br>
`:W<CR>`: save all & `:Q<CR>`<br>

`\tg`: open or close the window of taglist<br>

`<F5>`: go to shell, equivalent to `:term<CR>`<br>
`gg=G`: format the current file with `autopep8`<br>

`mh`: move cursor to left window<br>
`mj`: move cursor to bottom window<br>
`mk`: move cursor to top window<br>
`ml`: move cursor to right window<br>
`mw`: move cursor to window below/right of the current one<br>
`mt`: move cursor to top-left window<br>
`mb`: move cursor to bottom-right window<br>
`mp`: move cursor to previous window<br>

`+`: increase width of window towards left<br>
`-`: decrease width of window towards right<br>

`<C-j>`: <INSERT mode> move cursor backwards out of parenthesis<br>
`<C-k>`: <INSERT mode or NORMAL mode> goto normal mode and save<br>

`\cc`: comment one line<br>
`\cv`: comment one line with next delimiter<br>
`\cm`: comment multi lines<br>
`\c$`: comment to end of line<br>
`\cu`: uncomment<br>

`<C-p>`: search file in project<br>

`:Grep [keyword]<CR>`: search the keyword in project<br>
`\vv`: search the word under cursor in project<br>
`:Replace [keyword]<CR>`: replace the word under cursor with `keyword` in project<br>
`:Replace [target] [keyword]<CR>`: replace the word `target` with `keyword` in project<br>
`:UndoReplace<CR>`: undo `:Replace`<br>
`cgt`: save changes and close all tabs except the first, then close the bottom-right window<br>
`:ccl<CR>`: close `Grep` window<br>

`\'`: wrap selected part by "'", if no part is selected, the word under cursor will be wrapped<br>
`\\'`: remove the closest "'" wrapped the part in which the cursor is<br>
similar shortcuts: `\"` and `\\"`, `\(` and `\\(`, `\[` and `\\[`, `\{` and `\\{`, `\<` and `\\<`<br>

`<F12>`: goto definition<br>
`<C-o>`: go backword<br>
`<C-i>`: go forward<br>

To get more information about usage, click on the links at the References below.


### Tips ###
1) `vim -Nu ~/.vim/bundle/YouCompleteMe/vimrc_ycm_minimal xxx.py` to get minimal vim configuration for YCM to debug YCM.<br>
2) Debug commands of YCM: `:YcmDiags`, `YcmDebugInfo`, `YcmToggleLogs`.


### References ###
https://github.com/VundleVim/Vundle.vim<br>
https://github.com/Valloric/YouCompleteMe<br>
https://github.com/preservim/nerdtree<br>
https://github.com/dense-analysis/ale<br>
https://github.com/ctrlpvim/ctrlp.vim<br>
https://github.com/scrooloose/nerdcommenter<br>
https://github.com/majutsushi/tagbar<br>
https://github.com/vim-airline/vim-airline<br>
https://github.com/vim-airline/vim-airline-themes<br>
https://github.com/rstacruz/sparkup<br>
https://github.com/Yggdroot/indentLine<br>
https://github.com/jiangmiao/auto-pairs<br>
https://github.com/tpope/vim-repeat<br>
https://github.com/tpope/vim-fugitive<br>
https://github.com/Xuyuanp/nerdtree-git-plugin<br>
https://github.com/YvesZHI/vim-code-dark<br>
https://github.com/vim-python/python-syntax<br>
https://github.com/YvesZHI/killersheep<br>
https://codeyarns.com/2015/03/18/how-to-test-color-setup-in-vim
