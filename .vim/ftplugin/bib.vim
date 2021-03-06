let g:abbot_cite_style = "bib"
let g:abbot_replace_text = "linespace"

function! BibFoldText()
    let l:lnum = v:foldstart
    let l:type = ''
    let l:title = ''
    while l:lnum <= v:foldend
        let l:type_match = matchlist(
                    \ getline(l:lnum),
                    \ '\v\@(\S+)\s*\{\s*(\S+),'
                    \ )
        if l:type_match != []
            let l:type = l:type_match[1] . '{' . l:type_match[2] . '}'
            break
        else
            let l:lnum += 1
        endif
    endwhile
    let l:lnum = v:foldstart
    while l:lnum <= v:foldend
        let l:title_match = matchlist(
                    \ getline(l:lnum),
                    \ '\vtitle\s*\=\s*(\{(.+)\}|\"(.+)\")\s*,'
                    \ )
        if l:title_match != []
            let l:title = l:title_match[2]
            break
        else
            let l:lnum += 1
        endif
    endwhile
    if strlen(l:type) > 0
        if strlen(l:title) > 0
            return '+-- ' . l:type . ' -- ' . l:title . ' '
        else
            return '+-- ' . l:type . ' '
        endif
    else
        " wasn't found. Just return the default fold text
        return foldtext()
    endif
endfunction
setlocal foldmethod=syntax
setlocal foldtext=BibFoldText()
