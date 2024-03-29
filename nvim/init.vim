" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/dracula/vim.git', { 'as': 'dracula' }
Plug 'https://github.com/junegunn/fzf.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/udalov/kotlin-vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/github/copilot.vim.git', { 'branch': 'release' }
call plug#end()

" General
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
set cursorline
let mapleader = " "

" Colors
set t_Co=256
syntax on
colorscheme dracula
augroup dracula_customization
    au!
    highlight Normal ctermbg=234
    highlight SpecialKey ctermfg=238
    highlight CursorLine ctermbg=235
augroup END

" Airline
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Deoplete
let g:deoplete#enable_at_startup = 1

" File types
au BufRead,BufNewFile Podfile set filetype=ruby
au BufReadPost BUCK set syntax=python
au BufRead,BufNewFile *.config set filetype=dosini
au BufRead,BufNewFile config set filetype=dosini
au BufRead,BufNewFile *.fish set filetype=sh

" Uppercase alias
:command Q q
:command W w
:command WQ wq
:command Wq wq

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>v <Esc>:split<CR>
nnoremap <Leader>o <Esc>:vs<CR>
nnoremap <Leader>t <Esc>:tabedit<CR>

" FZF
nnoremap <F2> <Esc>:FZF<CR>
nnoremap <F3> <Esc>:Find<CR>
command! -bang -nargs=* Find 
            \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, 
            \ fzf#vim#with_preview(),
            \ <bang>0)
set grepprg=rg\ --vimgrep

" Undotree
nnoremap <Leader>u <Esc>:UndotreeToggle<CR>:UndotreeFocus<CR>
