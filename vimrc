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
set linebreak
set autoindent
filetype plugin indent on

set backspace=indent,eol,start " Allow backspacing over indentation, line breaks and insertion starts

if $COLORSCHEME == 'light'
  set background=light
else
  set background=dark
endif
set laststatus=2
set showmode " Show mode at bottom
set showcmd  " Show incomplete commands

set noswapfile
set nobackup
set nowb

set history=1000  " Store longer history

set undofile            " Persist undo history between sessions
set undodir=~/.vim/undo " ...but store all the persisted files in a single directory

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
" Note: This should be mxw/vim-jsx, but there's currently a bug that makes
" comments in the JSX nodes be wrongly highlighted. This is the branch whos PR
" fixes it. Ref mxw/vim-jsx#165 and mxw/vim-jsx#164
Plug 'jiulongw/vim-jsx', { 'branch': 'comments' }
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
Plug 'reasonml-editor/vim-reason-plus'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'wincent/terminus'   " Better vim + tmux
Plug 'leafgarland/typescript-vim'
Plug 'wellle/targets.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'ap/vim-css-color'
Plug 'octref/RootIgnore'  " Add .gitignore files to wildignore
Plug 'tpope/vim-fugitive' " Necessary for the CTags stuff to work
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'justinmk/vim-sneak'
Plug 'flowtype/vim-flow'
Plug 'vim-scripts/AutoComplPop'
Plug 'gabrielelana/vim-markdown'

call plug#end()

" Set the leader options
let mapleader = ' '

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

" Configure flowtype, which we need for YouCompleteMe to work
let g:flow#enable = 0 " Disable showing errors, ale does this for us

" Configure JavaScript highlighting
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1

" Configure ale (linting)
let g:ale_sign_column_always = 1
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚠️'
let g:ale_linters = {
      \'javascript': ['flow']
      \} " , 'eslint'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_javascript_eslint_suppress_eslintignore = 1
let g:ale_javascript_eslint_use_global = 0
let g:ale_fixers = {
      \'javascript': ['prettier']
      \}
let g:ale_completion_enabled = 1

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

" Configure vim-sneak
let g:sneak#s_next = 1 " Jump to next match when pressing s again
let g:sneak#label = 1  " Use label mode, similar to easymotion

" Open new splits to the right and the bottom
set splitbelow
set splitright

" Run :ALEFix on CTRL + F
nmap <C-f> :ALEFix<CR>

" Set up ReasonML
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

" Markdown
let g:markdown_enable_spell_checking = 0
let g:markdown_include_jekyll_support = 0
