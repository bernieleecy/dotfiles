let g:python_highlight_all = 1
" Maximum line width for `gq`.
set textwidth=79

" Recalculate folds upon saving.
function RecalcFolds()
    call SimpylFold#Recache()
    normal zx
endfunction
autocmd BufWritePre <buffer> call RecalcFolds()
