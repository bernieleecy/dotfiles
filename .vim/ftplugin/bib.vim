function ExpandDOI()
let doi = expand("<cWORD>")
echo "expanding DOI " .. doi .. "..."
python3<<EOF
import vim
from cygnet import cite
# get the citation
doi = vim.eval('expand("<cWORD>")')
try:
    citation = cite(doi)
    citation = citation.replace("'","''")
except Exception as e:
    citation = "error"
vim.command("let citation='{}'".format(citation))
EOF
if citation != "error"
    let lineno = line(".")
    " twiddle with empty lines before citation
    if !empty(trim(getline(line(".") - 1)))
        let x = append(line(".") - 1, "")
        let lineno += 1
    endif
    " replace the line with the citation
    put =citation | redraw
    " twiddle with empty lines after citation
    if !empty(trim(getline(line(".") + 1)))
        let x = append(line("."), "")
    endif
    execute lineno .. " delete _"
else
    redraw | echohl ErrorMsg | echo "invalid DOI " .. doi | echohl None
endif
endfunction

nnoremap <leader>e :call ExpandDOI() <CR>
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
