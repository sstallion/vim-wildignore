" wildignore.vim - read wildignore patterns from a file
" Last Change:  2016 Sep 09
" Maintainer:   Steven Stallion <sstallion@gmail.com>
" License:      Simplified BSD License

if exists('g:loaded_wildignore') || !has('wildignore')
  finish
endif
let g:loaded_wildignore = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:wildignore_fname')
  let g:wildignore_fname = 'wildignore'
endif

function! s:WildignoreFromFile(...)
  if a:0 > 0
    let files = a:000
  else
    let files = []
    for path in split(&runtimepath, ',')
      " The default pattern file can collide with existing wildignore
      " patterns; avoid functions like findfile, which honor them.
      let file = fnamemodify(path.'/'.g:wildignore_fname, ':p')
      if filereadable(file)
        call add(files, file)
      endif
    endfor
  endif

  let patterns = split(&wildignore, ',')
  for file in files
    if !filereadable(file)
      echoerr "wildignore: can't read file: ".file
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
  let &wildignore = join(patterns, ',')
endfunction

command -nargs=? WildignoreFromFile :call <SID>WildignoreFromFile(<f-args>)

augroup wildignore
  autocmd!
  autocmd VimEnter * WildignoreFromFile
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
