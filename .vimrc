" =========================
" Basic settings & compatibility
" =========================
set nocompatible

" Enable true colors if supported (modern terminals handle color negotiation automatically)
if has('termguicolors')
  set termguicolors
endif
set background=dark

" Try to load your preferred colorscheme; fallback gracefully if not found
silent! colorscheme atom-dark-256
if !exists('g:colors_name')
  silent! colorscheme industry
endif

" Enable syntax highlighting
syntax on


" =========================
" Indentation
" =========================
set tabstop=4            " Number of spaces per tab character
set shiftwidth=4         " Indentation size for << and >>
set expandtab            " Convert tabs to spaces
set autoindent           " Copy indentation from the previous line
filetype plugin indent on " Enable filetype-specific indenting and plugins


" =========================
" User Interface
" =========================
set number               " Show line numbers
set cursorline           " Highlight the current line

" Custom cursor line style (works in both terminal and GUI)
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set showmatch            " Highlight matching parentheses/brackets
set wildmenu             " Visual autocomplete for command-line
set wildmode=longest:full,full

set scrolloff=3          " Keep 3 lines visible above/below the cursor
set scrolljump=5         " Scroll by 5 lines when cursor leaves screen

set laststatus=2         " Always show status line
set ruler                " Show cursor position in status bar

set noerrorbells         " Disable error beeps
set visualbell           " Use visual bell instead of sound
if exists('&t_vb')
  set t_vb=              " Disable terminal bell if option exists
endif

" GUI-specific options (only apply in GVim)
if has('gui_running')
  if exists('&linespace')
    set linespace=16     " Adjust line spacing in GUI
  endif
  if exists('&guioptions')
    set guioptions-=l    " Hide left scrollbar
    set guioptions-=L
    set guioptions-=r    " Hide right scrollbar
    set guioptions-=R
  endif
endif


" =========================
" Sensible defaults
" =========================
set ignorecase           " Case-insensitive search
set smartcase            " Be case-sensitive if uppercase letters are used
set incsearch            " Show matches while typing search
set hlsearch             " Highlight all matches

set splitbelow           " Open horizontal splits below
set splitright           " Open vertical splits to the right
set hidden               " Allow switching buffers without saving

" Use system clipboard if available
if has('clipboard')
  set clipboard^=unnamed,unnamedplus
endif

" Enable persistent undo and create undo directory if it doesn’t exist
if has('persistent_undo')
  if has('nvim')
    let s:undodir = stdpath('data') . '/undo'
  else
    let s:undodir = expand('~/.vim/undo')
  endif
  if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p')
  endif
  execute 'set undodir=' . s:undodir
  set undofile
endif

" Create swap and backup directories if missing
if has('nvim')
  let s:datadir = stdpath('data')
else
  let s:datadir = expand('~/.vim')
endif
for s:sub in ['swap', 'backup']
  if !isdirectory(s:datadir.'/'.s:sub)
    call mkdir(s:datadir.'/'.s:sub, 'p')
  endif
endfor
execute 'set directory=' . s:datadir.'/swap//'
execute 'set backupdir=' . s:datadir.'/backup//'
set backup
set writebackup


" =========================
" Quality of life mappings
" =========================
" Press ESC twice to clear search highlighting
nnoremap <silent> <Esc><Esc> :noh<CR>

" Automatically trim trailing whitespace before saving
augroup trim_trailing_ws
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END
