set nocompatible

"-------------- Themes and color --------------
set t_CO=256					" Number of colors in terminal
colorscheme atom-dark-256		" My Vim TUI color scheme
syntax on						" Enable syntax highlighting

"-------------- Indentation --------------
set tabstop=4					" Number of spaces per tab
set shiftwidth=4				" Indent 4 columns for << and >> operations
set expandtab					" Replace tab with space
set autoindent					" Indent at the same level of the previous line

"------------- UI Tweaks ----------------
set linespace=16				" Set the line height
set number						" Show line numbers
set cursorline					" Highlight current line 
filetype indent on				" Load filetype-specific indent files
set noerrorbells				" Disable bell for errors that display messages
set vb t_vb=					" Disable bell for errors that do not display messages
set guioptions-=l				" Hide left scroll bar
set guioptions-=L				" Hide left scroll bar in splitted window
set guioptions-=r				" Hide right hand scroll bar
set guioptions-=R				" Hide right hand scroll bar in splitted window
set showmatch					" Highlight matching {[()]} automatically
set wildmenu					" Visualize autocomplete menu for command
set scrolljump=5				" Lines to scroll when cursor leaves screen
set scrolloff=3					" Minium lines to keep above and below the cursor
set laststatus=2				" Always display status line
set ruler						" Display the line and column of the cursor in status bar
