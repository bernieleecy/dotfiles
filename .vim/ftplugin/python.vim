let g:python_highlight_all = 1
" Maximum line width for `gq`.
set textwidth=79

let $PYTHONUNBUFFERED=1
let g:asyncrun_open=10
nnoremap <leader>p :AsyncRun -raw python % <CR>

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2

" Recalculate folds upon saving.
function RecalcFolds()
    call SimpylFold#Recache()
    normal zx
endfunction
autocmd BufWritePre <buffer> call RecalcFolds()

"" Flake8 configuration
nnoremap <buffer> <leader>f :call flake8#Flake8()<CR>
let g:flake8_quickfix_height=10

" remove trailing whitespace in python files
autocmd BufWritePre * %s/\s\+$//e
