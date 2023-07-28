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
let g:vimtex_view_method = 'skim'

let g:vimtex_fold_enabled =1
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_syntax_packages={'siunitx': {'load': 0}} 
set spell spelllang=en_gb

function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d '[:space:]'"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()
