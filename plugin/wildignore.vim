" wildignore.vim - read suffixes and wildignore patterns from a file
" Last Change:  2017 Jun 13
" Maintainer:   Steven Stallion <sstallion@gmail.com>
" License:      Simplified BSD License

if exists('g:loaded_wildignore')
  finish
endif
let g:loaded_wildignore = 1

let s:save_cpo = &cpo
set cpo&vim

augroup wildignore
  autocmd!
  autocmd VimEnter * call wildignore#init()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
