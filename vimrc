" |--------------------------------|
" | Author: Zack Rosen             |
" | Email: zjrosen@gmail.com       |
" | ------------------------------ |
" | Edited by: Bruce McElroy       |
" | Email: bruce.mcelroy@gmail.com |
" | Info: A solid vimrc            |
" |--------------------------------|

" [ Vundle Setup ]{{{1
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Github
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'Yggdroot/indentLine'
Plugin 'pangloss/vim-javascript'
Plugin 'jimmyhchan/dustjs.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Shutnik/jshint2.vim'
" Plugin 'tommcdo/vim-exchange'
" Plugin 'terryma/vim-multiple-cursors'

" vim-scripts
Plugin 'Tabular'
Plugin 'ctrlp.vim'

call vundle#end()

filetype plugin indent on
" [ Prefrences ] {{{1
let mapleader = ","                    " Set global mapleader
set noswapfile
set autoindent
set smartindent
set hidden                             " Useful for auto setting hidden buffers
syntax enable                          " Enable syntax highlighting
set nostartofline                      " Don't reset cursor to start of line when moving around
set ttyfast
set history=1000
" Searching/Moving {{{2
" nnoremap / /\v
" vnoremap / /\v
set gdefault                          " Add the g flag to search/replace by default
set incsearch                         " Highlight dynamically as pattern is typed
" set hlsearch
set ignorecase                        " Ignore case when searching
set smartcase                         " Try and be smart about cases
nnoremap j gj
nnoremap k gk
" Appearance {{{2
set number                          " Always show line numbers
set numberwidth=3                     " Changed the width of line number columns
set listchars=tab:\|\ ,trail:·,eol:¬  " Use new symbols for tabstops and EOLs
set ts=4 sts=4 sw=4 noexpandtab       " Default tab stops
set backspace=indent,eol,start
set showcmd                           " Shows incomplete command
set novb noeb                         " Turn off visual bell and remove error beeps
set splitbelow                        " New window goes below
set splitright                        " New windows goes right
set wildmenu                          " Enhance command-line completion
set wildmode=longest:full,full
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*.DS_Store
set encoding=utf-8
set cursorline                        " Highlight current line
set laststatus=2                      " Always show the statusline
set t_Co=256                          " Explicitly tell Vim that the terminal supports 256 colors

" Indent lines
let g:indentLine_color_term = 235
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
set tabstop=4 softtabstop=4 expandtab shiftwidth=4

" Colors and Theme {{{2
set background=dark
colorscheme monokai

" Run JSHint on save
autocmd! BufWritePost *.js JSHint

" Save on losing focus {{{2
au FocusLost * :wa

" Resize splits when window is resized {{{2
au VimResized * exe "normal! \<c-w>="

" Force quit that bitch
nmap fq :q!<CR>

" Folding {{{2
nnoremap <Tab> za

" Use ,z to "focus" the current fold
nnoremap <leader>z zMzvzz

" Window Switching {{{2
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Window Resizing {{{2
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>

" Insert Movement {{{2
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>l
imap <C-b> <C-o>h

" Indent Mapping {{{2
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-[> >gv

" Awesome fucking pasting {{{2
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

" Toggle Spell Checking -- s {{{2
nmap <silent> <leader>s :set spell!<CR>

" Emmet {{{2"
let g:user_emmet_leader_key = '<c-e>'

"Fugitive Git {{{2
nmap <leader>ga :Git add -A<CR>
nmap <leader>gc :Gcommit -a<CR>
nmap <leader>gp :Git push<CR>

" Surround selection with backticks
nnoremap <leader>` 0

" Surround selection with "
nmap <leader>" viwS"

" Surround selection with '
nmap <leader>' viwS'

" CtrlP {{{2
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git'
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab

" MultipleCursors {{{2
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_quit_key='<C-c>'

" Mustache {{{2
let g:mustache_abbreviations = 1

" NerdTree {{{2
autocmd vimenter * if !argc() | NERDTree | endif " Load NERDTree by default for directory
map <C-n><C-t> :NERDTreeToggle<CR>

" Powerline {{{2
" let g:Powerline_symbols = 'fancy'

" Tabularize {{{2
if exists(":Tabularize")
	nmap <Leader>t= :Tabularize /=<CR>
	vmap <Leader>t= :Tabularize /=<CR>
	nmap <Leader>t: :Tabularize /:\zs<CR>
	vmap <Leader>t: :Tabularize /:\zs<CR>
	nmap <Leader>t> :Tabularize /=><CR>
	vmap <Leader>t> :Tabularize /=><CR>
endif
