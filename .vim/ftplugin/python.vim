let g:python_highlight_all = 1
" Maximum line width for `gq`, updated to 88 to match black
set textwidth=88

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

" remove trailing whitespace in python files
autocmd BufWritePre * %s/\s\+$//e
