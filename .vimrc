set number
set gfn=Monaco:h12
"set fillchars=fold:\ 
set autoindent
set noshowmode " for use with jedi-vim show_call_signatures = 2
set backspace=indent,eol,start
filetype plugin indent on
set autochdir

set tabstop=4
set shiftwidth=4
set expandtab
set incsearch 
augroup vimrc-incsearch-highlight
                  autocmd!
                  autocmd CmdlineEnter /,\? :set hlsearch
                  autocmd CmdlineLeave /,\? :set nohlsearch
                augroup END

set display+=lastline
set ignorecase
set smartcase
set linebreak
set splitbelow
set splitright

let g:tex_no_error=1

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex' 
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'skywind3000/asyncrun.vim'
Plug 'machakann/vim-sandwich' 
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'inside/vim-search-pulse'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'yongrenjie/abbotsbury.vim'
Plug 'sainnhe/sonokai' 
Plug 'adrian5/oceanic-next-vim'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'bluz71/vim-embark-guicolors'

call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

"let g:palenight_color_overrides = {
"\    'black': { 'gui': '#1D1C1F', "cterm": "234", "cterm16": "0" },
"\}

syntax on
set background=dark
colorscheme embark
"
function ToggleColors()
    if &background == "dark"
        set background=light
        colorscheme papercolor
    else 
        set background=dark
        colorscheme embark
    endif
endfunction

nnoremap <leader>bg :call ToggleColors()<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>hl :set hlsearch! hlsearch?<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <space> za
nnoremap <C-n> :NERDTreeToggle<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
"set conceallevel=2
let g:abbot_use_git_email = 1
"Ignore tex auxiliary files in NERDTree
let NERDTreeIgnore = ['\.aux$', '\.log$', '\.out$', '\.fls$','\.pdf$',
                     \ '\.fdb_latexmk$', '\.synctex\.gz$', '\.listing$',
                     \ '\.bbl$', '\.bcf$', '\.blg$', '\.toc$', '\.run\.xml$']

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ }

"" Syntax sync -- for long files where vim gets confused
nnoremap <leader>ssf :syntax sync fromstart<CR>
