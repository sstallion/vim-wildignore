" wildignore.vim - read suffixes and wildignore patterns from a file
" Last Change:  2017 Jun 13
" Maintainer:   Steven Stallion <sstallion@gmail.com>
" License:      Simplified BSD License

let s:save_cpo = &cpo
set cpo&vim

let g:suffixes_fname = get(g:, 'suffixes_fname', 'suffixes')
let g:wildignore_fname = get(g:, 'wildignore_fname', 'wildignore')

function! s:readpatterns(fname)
  let files = []
  for path in split(&runtimepath, ',')
    " The default pattern file can collide with existing wildignore
    " patterns; avoid functions like findfile, which honor them.
    let file = fnamemodify(path . '/' . a:fname, ':p')
    if filereadable(file)
      call add(files, file)
    endif
  endfor

  let patterns = []
  for file in files
    if !filereadable(file)
      echoerr "wildignore: can't read file: " . file
      return
    endif
    for line in readfile(file)
      " Strip extraneous whitespace and newlines;
      " see: http://stackoverflow.com/a/4479072.
      let line = substitute(line, '^\s*\(.\{-}\)\s*\r*\n*$', '\1', '')
      if line == '' || line =~ '^"' " skip empty lines and comments
        continue
      endif
      call add(patterns, line)
    endfor
  endfor
  return join(patterns, ',')
endfunction

function! wildignore#init()
  let &suffixes = s:readpatterns(g:suffixes_fname)
  let &wildignore = s:readpatterns(g:wildignore_fname)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
