"*** *** *** *** *** ***"
set nocompatible	"required
filetype off		"required
"*** *** *** *** *** ***"


"*** *** *** *** *** ***"
" disable bell sound
set belloff=all
"*** *** *** *** *** ***"

set nohlsearch
set lazyredraw


"*** *** *** *** *** ***"
" Begin vim-plug section
call plug#begin('~/.vim/plugged')

"add all yout plugins here 

" emmet plugin for vim
Plug 'mattn/emmet-vim'
" html5, inline svg omnicomplete function, indent and syntax
Plug 'othree/html5.vim'

Plug 'vim-airline/vim-airline'

" auto completer
Plug 'ycm-core/YouCompleteMe', {'do': 'python3 ./install.py --ts-completer'}
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

" React syntax highlighting and indenting plugin
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"cobalt2 colorscheme
Plug 'morhetz/gruvbox'

" css color highliter
Plug 'ap/vim-css-color'
"Plug 'RRethy/vim-hexokinase'

" highlight indents
Plug 'Yggdroot/indentLine'

" move text
Plug 'matze/vim-move'

" prettier editor integration
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" commenting text
Plug 'tpope/vim-commentary'

" surronding text
Plug 'tpope/vim-surround'

" file tree
Plug 'preservim/nerdtree'

" All of your plugins must be added before the following line

" Initialize plugin system
call plug#end()
"*** *** *** *** *** ***"


"*** *** *** *** *** ***"
set number relativenumber
"colorscheme cobalt2
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=16
let g:gruvbox_italic=1
"*** *** *** *** *** ***"

"*** *** *** *** *** ***"
"Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
"*** *** *** *** *** ***"

"*** *** *** *** *** ***"
" YouCompleteMe
" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeop = 0
"*** *** *** *** *** ***"


"*** *** *** *** *** ***"
" configuratiln for html5.vim
" Disable event-handler attributes support
" let g:html5_event_handler_attributes_compelete = 0

" Disable RDFa attributes support
" let g:html5_rdfa_attributes_compelete = 0

" Disable microdata attributes support
" let g:html5_microdata_attributes_compelete

" Disable WAI-ARIA attribute support
" let g:html5_aria_attribute_compelete = 0
"*** *** *** *** *** ***"


"*** *** *** *** *** ***"
" set tabwidth and indents for web-dev files
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set textwidth=80
set fileformat=unix
set smartindent
" convert tab to spaces
set expandtab
"*** *** *** *** *** ***"


"*** *** *** *** *** ***"
" Enable code folding for javascript based on out syntax file

"augroup javacript_folding
"  au!
"  au FileType javascript setlocal foldmethod=syntax
"augroup END

""*** *** *** *** *** ***"


"*** *** *** *** *** ***"
" set the characters for indenting
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceEnabled = 1
"*** *** *** *** *** ***"


"*** *** *** *** *** ***"
" moving text shortcuts
let g:move_key_modifier = 'C'
"*** *** *** *** *** ***"

"*** *** *** *** *** ***"
" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#bracket_same_line = 'false'
let g:prettier#jsx_single_quote = 'false'
let g:prettier#semi = 'true'
"*** *** *** *** *** ***"

"*** *** *** *** *** ***"
" NERDTree

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDTree default size
let g:NERDTreeWinSize=20

"*** *** *** *** *** ***"
