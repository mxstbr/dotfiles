set nocompatible " improved mode

"
" Options
"
set number         " Show current line number as absolute number
set relativenumber " Show relative line numbers otherwise
set numberwidth=2  " Numbers are 1 char wide

set tabstop=4     " One tab = 4 spaces
set shiftwidth=2  " One tab press = 2 spaces
set softtabstop=2 expandtab " Tab => spaces
set background=dark         " Needed for solarized colorscheme

set omnifunc=syntaxcomplete#Complete " Enable auto completion
set completeopt=longest,menuone      " Select the match with the most common text, rather than the first one, in omnicomplete
" Select omnicomplete option with ENTER
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Always keep a menu item highlighted
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" ???? All of these are from http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set incsearch  " Do highlight phrases while searching
set nohlsearch " Don't continue to highlight searched phrases
set ignorecase " Case insensitive search

" Add the silver searcher to the runtimepath
set rtp+=/usr/local/opt/fzf

" Automatically read changed files from disk, see https://unix.stackexchange.com/a/383044
set autoread
au FocusGained,BufEnter * :checktime " Also reload when we switch buffers

"
" Plugins
"
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'Aldlevine/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }
Plug 'jiangmiao/auto-pairs'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'reasonml-editor/vim-reason'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-scripts/AutoComplPop'
Plug 'wincent/terminus'

call plug#end()

" Configure NerdTree
autocmd StdinReadPre * let s:std_in=1 " Automatically open NerdTree if a directory is opened in vim
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if the only window left open is NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 " Use NERDTree with a mouse
nnoremap <C-\> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusNodeColorization=1 " Enable git status colorisation a la Atom
let g:NERDTreeShowHidden=1 " Show hidden files by default

" Configure vim-nerdtree-sync
let g:nerdtree_sync_cursorline=1 " Enable syncing of active file to nerdtree

" Configure color scheme
colorscheme solarized

" Configure flowtype
let g:flow#autoclose=1 " Don't open flow window if there's no errors
" let g:flow#showquickfix=0 " Don't show error box

" Configure JavaScript highlighting
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

" Configure ale (linting)
let g:ale_sign_column_always = 1
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '👉'
let g:ale_linters = {
      \'javascript': ['flow']
      \}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers = {
      \'javascript': ['prettier']
      \}

" Configure JSX highlighting
let g:jsx_ext_required=0 " Highlight JSX in .js files

" Configure vim-tmux-navigator
let g:tmux_navigator_save_on_switch=1
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
" Want to disable 'navigate to previous', have to remap all the things
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <Nop> :TmuxNavigatePrevious<cr>

" Configure vim-fzf
nmap <C-p> :Files<CR>
