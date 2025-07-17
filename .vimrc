" --- General Settings ---
set nocompatible            " Be iMproved, required

filetype off                " Required for some plugins (though we're not using any initially)
" --- vim-plug configuration ---
call plug#begin('~/.vim/plugged') " Directory where plugins will be installed

Plug 'catppuccin/vim', { 'as': 'catppuccin' } " Add the Catppuccin plugin
Plug 'JuliaEditorSupport/julia-vim'

call plug#end() " End of plugins" --- Basic Vimrc Configuration ---

" Basic UI settings
set encoding=utf-8          " Set encoding to UTF-8
set showcmd                 " Show (partial) command in status bar
set showmode                " Show current mode (INSERT, REPLACE, VISUAL)
set showmatch               " Highlight matching brackets/parentheses
set autoread                " Automatically reload files if they change on disk
set cmdheight=1             " Command-line height. Set to 2 if you see truncated messages.
set laststatus=2            " Always show the status line

" Indentation
set autoindent              " Copy indent from current line to new line
set smartindent             " Smart autoindenting for C-like languages
set tabstop=4               " Number of spaces a tab counts for
set shiftwidth=4            " Number of spaces to use for autoindenting
set expandtab               " Use spaces instead of tabs

" Line numbers
set number                  " Show line numbers
set relativenumber        " Show relative line numbers (uncomment if you prefer this for navigation)
" set cursorline            " Highlight the current line (uncomment if you prefer this)

" Search
set hlsearch                " Highlight all search matches
set incsearch               " Show search results as you type
set ignorecase              " Ignore case in search patterns
set smartcase               " Override ignorecase if pattern contains uppercase

" Display
set wrap                    " Wrap long lines
set breakindent             " Maintain indent when wrapping
set textwidth=80            " Wrap lines at 80 characters (useful for code style)
" set colorcolumn=81          " Highlight column 81 (visual cue for textwidth)
" set spell spelllang=en_us   " Enable spell checking (uncomment and adjust language if needed)

" Appearance (Colorscheme)
set termguicolors
syntax enable               " Enable syntax highlighting
colorscheme catppuccin_mocha          " Use the 'desert' colorscheme (it's built-in and generally pleasant)
                            " You can try others like 'default', 'blue', 'darkblue', 'peachpuff', 'ron'
" set background=dark       " Tell Vim your terminal background is dark (adjust if your terminal is light)

" --- Mappings (Optional, but useful) ---
" Leader key - useful prefix for custom keybindings
let mapleader = " "         " Set space as the leader key

" Easier saving and quitting
nnoremap <leader>w :w<CR>   " Map space-w to save
nnoremap <leader>q :q<CR>   " Map space-q to quit
nnoremap <leader>Q :qa<CR>  " Map space-Q to quit all windows
nnoremap <leader>wq :wq<CR> " Map space-wq to save and quit

" Easier navigation
" nnoremap <leader>h <C-w>h " Move to left window
" nnoremap <leader>l <C-w>l " Move to right window
" nnoremap <leader>j <C-w>j " Move to bottom window
" nnoremap <leader>k <C-w>k " Move to top window

" Toggle line numbers (leader-n)
nnoremap <leader>n :set invnumber<CR>

" Toggle paste mode (leader-p) - useful when pasting into terminal Vim
" This helps prevent autoindent from messing up pasted code.
nnoremap <leader>p :set paste!<CR>
vnoremap <leader>y "+y
