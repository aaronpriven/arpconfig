" ################## VUNDLE START

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

"set rtp+=~/sh/vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin('~/.vim/plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Remember when installing on a new system to run 'PluginInstall' at 
" a prompt

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'w0rp/ale'

au VimEnter * com! CriticOn  let b:ale_linters = { 'perl': ['perl', 'perlcritic' ] } | ALELint
au VimEnter * com! CriticOff let b:ale_linters = { 'perl': ['perl'] } | ALELint
let perl_include_pod = 0

let g:ale_linters = { 'perl': ['perl'] , 'html': [] } 
" turn off HTML linting because I have to edit lots of partial html files

let g:ale_change_sign_column_color = 1
"let g:ale_sign_column_always = 1

let g:ale_sign_error = "E>"
let g:ale_sign_warning = "W>"
let g:ale_sign_info = "I>"
let g:ale_sign_style_error = "e>"
let g:ale_sign_style_warning = "w>"
let g:ale_perlcritic_profile = ""
" uses default perlcriticrc rules

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ################## VUNDLE END

syntax on

set nohlsearch

set backup backupdir=/var/tmp/$USER/vim-backups,~/tmp,/var/tmp,/tmp,.
set directory=/var/tmp/$USER/vim-swap//,.,~/tmp//,/var/tmp//,/tmp//

set ffs=unix,mac,dos

com! Synperl set filetype=perl
com! Synhtml set filetype=html

com! T12 set tabstop=12
com! T13 set tabstop=13
com! T8 set tabstop=8

set tabstop=12

com! Wrap set tw=72
com! NoWrap set tw=0

filetype indent off

filetype plugin on

let $RUNNING_UNDER_MACVIM = 1

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

noremap! <C-B> Actium::

let vim_markdown_preview_github=1
"let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<F12>'

"define :Tidy command to run perltidy on visual selection || entire buffer"
"command -range=% -nargs=* Tidy <line1>,<line2>!perltidier
"command -range=% -nargs=* Tidy <line1>,<line2>!perl ~/git/Perl-Tidy-Sweetened/script/perltidier

command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

"run :Tidy on entire buffer and return cursor to (approximate) original position"
fun DoTidy()
    let l = line(".")
    let c = col(".")
    :Tidy
    call cursor(l, c)
endfun

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open location list
        lopen
    endif
endfunction

nnoremap <C-S> gwap
nnoremap <F10> :call ToggleErrors()<CR>

"shortcut for normal mode to run on entire buffer then return to current line"
au Filetype perl nnoremap <F12> :call DoTidy()<CR>
au Filetype perl nnoremap <D-F> :call DoTidy()<CR>

" other perl things
au Filetype perl set number
au Filetype perl let g:ale_sign_column_always = 1
au Filetype perl set autoindent 

"shortcut for visual mode to run on the the current visual selection"
au Filetype perl vmap <F12> :Tidy<CR>
