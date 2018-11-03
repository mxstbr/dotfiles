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
set nowrap " Don't wrap lines
set linebreak
set autoindent
filetype plugin indent on

set backspace=indent,eol,start " Allow backspacing over indentation, line breaks and insertion starts

set background=dark " Needed for solarized colorscheme
set laststatus=2
set showmode " Show mode at bottom
set showcmd  " Show incomplete commands

set noswapfile
set nobackup
set nowb

set omnifunc=syntaxcomplete#Complete " Enable auto completion
set completeopt=longest,menuone      " Select the match with the most common text, rather than the first one, in omnicomplete
set history=1000  " Store longer history

set undofile            " Persist undo history between sessions
set undodir=~/.vim/undo " ...but store all the persisted files in a single directory

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
set smartcase  " ...unless you type a capital

" Add the silver searcher to the runtimepath
set rtp+=/usr/local/opt/fzf

" Automatically read changed files from disk, see https://unix.stackexchange.com/a/383044
set autoread
au FocusGained,BufEnter * :checktime " Also reload when we switch buffers

"
" Plugins
"
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible' " Sensible defaults
Plug 'scrooloose/nerdtree'
Plug 'Aldlevine/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hail2u/vim-css3-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs' " Insert parenthesis etc in pairs
Plug 'unkiwii/vim-nerdtree-sync' " Sync open file to NERDTree
Plug 'tpope/vim-abolish' " Case-preserving search and replace :S
Plug 'tpope/vim-surround'
Plug 'w0rp/ale' " Async linting
Plug 'editorconfig/editorconfig-vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'reasonml-editor/vim-reason'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-scripts/AutoComplPop'
Plug 'wincent/terminus'   " Better vim + tmux
Plug 'leafgarland/typescript-vim'
Plug 'wellle/targets.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'ap/vim-css-color'
Plug 'octref/RootIgnore'  " Add .gitignore files to wildignore
Plug 'tpope/vim-fugitive' " Necessary for the CTags stuff to work

call plug#end()

" Set the leader options
let mapleader = '\<Space>'
nnoremap <Leader>\ :edit .<cr>

" Configure NerdTree
:set mouse=a
let g:NERDTreeMouseMode=3 " Use NERDTree with a mouse
nnoremap <c-\> :edit .<cr>
let g:NERDTreeGitStatusNodeColorization=1 " Enable git status colorisation a la Atom
let g:NERDTreeShowHidden=1 " Show dotfiles by default
let loaded_netrwPlugin=1 " Disable netrw since we're going to hijack it with NERDTree anyway
let NERDTreeRespectWildIgnore=1 " Respect wildignore
let g:NERDTreeHijackNetrw = 1 " Use the split explorer model, hijack netrw
let g:NERDTreeMinimalUI=1 " Hide 'Press ? for help' prompt

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
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {
      \'javascript': ['flow', 'eslint']
      \}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_javascript_eslint_suppress_eslintignore = 1
let g:ale_javascript_eslint_use_global = 0
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

" Open new splits to the right and the bottom
set splitbelow
set splitright


