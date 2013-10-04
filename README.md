#lotus-vimrc
Just another vimrc, there is an install.sh, see  

    ./install.sh -h
  
#####Maintainer:  
[apporc](https://github.com/apporc)  
appleorchard2000 at gmail.com  
  
#####Thanks:
[Amir Salihefendic](https://github.com/amix)  
[cz848](https://github.com/cz848)  
[skyl](https://github.com/skyl)  

#####Languages supported:  
c, python, javascript, html, css, vim, php

#####Plugins used:  
* [Tagbar](https://github.com/vim-scripts/Tagbar.git)
* [NerdTree](https://github.com/scrooloose/nerdtree.git)
* [minibufexplorer](https://github.com/fholgado/minibufexpl.vim.git)
* [vim-pathogen](https://github.com/tpope/vim-pathogen.git)
* [powerline](https://github.com/Lokaltog/powerline.git)
* [Conque-Shell](https://github.com/apporc/Conque-Shell.git)
* [Indent-Guides](https://github.com/vim-scripts/Indent-Guides.git)
* [cscope](https://github.com/vim-scripts/cscope.vim.git)
* [pycscope](https://github.com/portante/pycscope.git)
* [cscope_maps](https://github.com/chazy/cscope_maps.git)
* [syntastic](https://github.com/scrooloose/syntastic.git)

#####Shotcuts:

    1.<F7> open NerdTree window.
    2.<F8> open Tagbar window.
    3.<F3> open the little bash shell window.
    4.<F12> jump to the definition of function or else.
    5.<F5> refresh tags.
    6.Leader key is <Space>.
    7.<Space>n/p for next/previous minibufexplorer tab, <Space>[n(n<10)/0n(n>=10)] for No.n tab.
    8.<F2> save file, <F4> save and close current buffer.
    9.In visual mode, * or # to search.
    10.In normal/visual mode, <tab> and <s-tab> to tab line(try it).
    11.<Ctrl-N> or <Ctrl-P> to autocomplete.
    12.For more, see mappings.vim and lan/ plugins/.
  
#####Screenshots:  
  ![Screenshot 1](https://lh4.googleusercontent.com/-cY7RcdUpwYg/Ub6QpXW-9OI/AAAAAAAAEPM/D1BS2g560H8/w1118-h640-no/Screenshot-2.png)
  ![Screenshot 2](https://lh6.googleusercontent.com/-COF7SB3qhvI/Ub6TSK7z4qI/AAAAAAAAEP8/21E69UwDBRY/w1118-h640-no/Screenshot-3.png)

#####NOTE:  
1. you need to run "git submodule init && git submodule update" at the 
top of git's working tree to sync those vim plugins at first
2. on ubuntu, install vim-gnome or compile vim from source code to get clipboard support  
3. if you want to use fancy mode for powerline, then config your patched font and change "unicode" to "fancy" in  
vimrc/plugins/powerline.vim  

