set number
set fillchars=fold:\ 
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
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'TaDaa/vimade'

call plug#end()

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_color_overrides = {
\    'black': { 'gui': '#1D1C1F', "cterm": "234", "cterm16": "0" },
\}

syntax on
set background=dark
colorscheme palenight
set t_Co=256
"highlight Folded ctermbg=96 ctermfg=7
"
function ToggleColors()
    if &background == "dark"
        set background=light
        let g:seoul256_background = 252
        colorscheme seoul256-light
    else 
        set background=dark
        colorscheme palenight
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

let $PYTHONUNBUFFERED=1
let g:asyncrun_open=10
nnoremap <leader>p :AsyncRun -raw python % <CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:vimtex_syntax_enabled=0
let g:vimtex_fold_enabled =1
let g:vimtex_complete_img_use_tail = 1
set conceallevel=2
let g:tex_conceal='abdmg'
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ }

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

"" Syntax sync -- for long files where vim gets confused
nnoremap <leader>ssf :syntax sync fromstart<CR>

"" Flake8 configuration
autocmd FileType python nnoremap <leader>f :call flake8#Flake8()<CR>
let g:flake8_quickfix_height=10

augroup ftdetect
    autocmd!
    autocmd BufNewFile,BufRead *.tex set filetype=tex
augroup END

" remove trailing whitespace in python files
autocmd BufWritePre *.py %s/\s\+$//e
