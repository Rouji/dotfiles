" output text to a scratch split
" overwrites the same split if it's already open
function! Scratch(output)
    let winnr = bufwinnr('__scratch')
    if winnr >= 0
        execute winnr . 'wincmd w'
    else
        split __scratch
        setlocal filetype=text
        setlocal buftype=nofile
        setlocal bufhidden=wipe
        setlocal noswapfile
        setlocal nobuflisted
        setlocal nonumber
        setlocal nofoldenable
        setlocal winfixwidth
        setlocal winfixheight
        resize 10
    endif
    normal! ggdG
    call append(0, split(a:output,'[\v\n]'))
    normal! gg
    wincmd p
    normal! gv
endfunction

" pipe selected text through mecab
function! Mecab() range
    let n = @n
    silent! normal gv"ny
    let out = system("echo '" . @n . "' | mecab")
    let @n = n
    call Scratch(out)
endfunction
autocmd BufRead,BufNewFile *.md,*.txt xnoremap <F6> :call Mecab()<CR>

" search for example sentences containing selection
function! Sentences() range
    let n = @n
    silent! normal gv"ny
    let out = system("sentences -s '" . @n . "'")
    let @n = n
    call Scratch(out)
endfunction
autocmd BufRead,BufNewFile *.md,*.txt xnoremap <F7> :call Sentences()<CR>

" search epwing dictionaries for selection
function! Epwing() range
    let n = @n
    silent! normal gv"ny
    let out = system("epw -d 新辞林 -s '" . @n . "'")
    let @n = n
    call Scratch(out)
endfunction
autocmd BufRead,BufNewFile *.md,*.txt xnoremap <F8> :call Epwing()<CR>

" open selected text in browser (url or text search)
function! Browse() range
    let n = @n
    silent! normal gv"ny
    call system("qb '" . @n . "'")
    let @n = n
endfunction
autocmd BufRead,BufNewFile *.md,*.txt xnoremap <F9> :call Browse()<CR>
