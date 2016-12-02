 # Original file with great efforts from rbasso <https://github.com/rbasso/dotfiles/blob/master/homedir/.vimrc>. Thank you!
 
 "Appearance
 set ruler
 set cursorline
 set colorcolumn=80
 set incsearch
 set showcmd
 set showmatch
 set list listchars=trail:·,tab:▹\ ,nbsp:█
 set termguicolors
 set relativenumber                       #shows the lines distance from the current line.
 syntax on
 "
 " Solarized settings
 colorscheme solarized8_light
 "
 " Italics
 highlight Comment cterm=italic
 "
 " Indents and tabs
 set backspace=indent,eol,start
 set autoindent
 set expandtab
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 "
 " Habit breaking
 noremap <Up>    <NOP>
 noremap <Down>  <NOP>
 noremap <Left>  <NOP>
 noremap <Right> <NOP>
 "
 " Miscellaneous
 set nomodeline
 set hidden
 set wildmode=longest:full
 set wildmenu
