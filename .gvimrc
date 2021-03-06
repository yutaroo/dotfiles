" fonts
if has('win32')
  set guifont=Monaco:h15
else
  set guifont=SourceCodePro-Regular:h12
endif

" Appearance
colorscheme onehalflight
set background=light
set cursorline
set laststatus=2
set linespace=4
set list
set number
set numberwidth=5

" Tab setting
if has('win32')
  function! GuiTabLabel()
    let l:label = ''
    let l:bufnrlist = tabpagebuflist(v:lnum)
    let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
    let l:label .= l:bufname == '' ? 'No title' : l:bufname

    for bufnr in l:bufnrlist
      if getbufvar(bufnr, "&modified")
        let l:label .= '+'
        break
      endif
    endfor

    return l:label
  endfunction

  set guitablabel=%N:\ %{GuiTabLabel()}
endif
