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
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Nerd tree
let NERDTreeShowHidden=1
map <c-t> :NERDTreeToggle<CR>

" Vim multi line
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-g>'

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <F2> <Esc>:FZF<CR>
map <F3> <Esc>:Find<CR>

set relativenumber  " Show line numbers
set tabstop=4       " Show \t with width of 4
set softtabstop=4   " Number of columns for a \t
set shiftwidth=4    " Indents with a width of 4
set smarttab        " Inserts space when hit the <Tab>
set expandtab       " Expand TABs to spaces
set splitbelow
set splitright
set clipboard=unnamed
set backspace=indent,eol,start
set listchars=tab:▶▶,space:·,
set list

set t_Co=256
syntax on
colorscheme minimalist

au BufRead,BufNewFile Podfile set filetype=ruby
au BufReadPost BUCK set syntax=python
au BufRead,BufNewFile *.config set filetype=dosini

highlight SpecialKey ctermbg=none ctermfg=238

" Leader
let mapleader=" "

" fzf
command! -bang -nargs=* Find 
            \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, 
            \ fzf#vim#with_preview(),
            \ <bang>0)
set grepprg=rg\ --vimgrep

" Uppercase alias
:command Q q
:command W w
:command WQ wq
:command Wq wq

" YouCompleteMe + Snip: https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
