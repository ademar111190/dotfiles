" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/sirver/UltiSnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/gisphm/vim-gradle.git'
Plug 'https://github.com/junegunn/fzf.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/mustache/vim-mustache-handlebars.git'
Plug 'https://github.com/dikiaap/minimalist.git'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/mkitt/tabline.vim.git'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Nerd tree
let NERDTreeShowHidden=1
" let NERDTreeMapOpenInTab='<ENTER>'
map <c-t> :NERDTreeToggle<CR>

" Vundle begin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'udalov/kotlin-vim'

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end

" General
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <F2> <Esc>:FZF<CR>
map <F3> <Esc>:Find<CR>

set number          " Show line numbers
set tabstop=4       " Show \t with width of 4
set softtabstop=4   " Number of columns for a \t
set shiftwidth=4    " Indents with a width of 4
set smarttab        " Inserts space when hit the <Tab>
set expandtab       " Expand TABs to spaces
set splitbelow
set splitright
set backspace=indent,eol,start
set listchars=tab:▶\ 
" =space:·,
highlight WhiteSpaceBol guifg=blue
highlight WhiteSpaceMol guifg=white
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/
set list

set t_Co=256
syntax on
colorscheme minimalist

au BufReadPost BUCK set syntax=python

" fzf
command! -bang -nargs=* Find 
            \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, 
            \ fzf#vim#with_preview(),
            \ <bang>0)
set grepprg=rg\ --vimgrep
