{{- if Plugin -}}
" Vimscript Setup: {{"{{{"}}1
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
"if exists("g:loaded_{{Name}}")
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_{{Name}} = 1

" Options: {{"{{{"}}1
if !exists('g:{{Name}}_some_plugin_option')
  let g:{{Name}}_some_plugin_option = 0
endif

" Private Functions: {{"{{{"}}1
function! s:some_local_function()
  echom "change s:some_local_function"
endfunction

" Public Interface: {{"{{{"}}1
function! SomeFunction()
  echom "change SomeFunction"
endfunction

" Maps: {{"{{{"}}1
nnoremap <Plug>{{toTitle Name}}1 :call <SID>some_local_function()<CR>
nnoremap <Plug>{{toTitle Name}}2 :call SomeFunction()<CR>

if !hasmapto('<Plug>{{toTitle Name}}1')
  nmap <unique><silent> <Leader>p1 <Plug>{{toTitle Name}}1
endif

if !hasmapto('<Plug>{{Name}}2')
  nmap <unique><silent> <Leader>p2 <Plug>{{toTitle Name}}2
endif

" Commands: {{"{{{"}}1
command! -nargs=0 -bar {{toTitle Name}}1 call <SID>some_local_function()
command! -nargs=0 -bar {{toTitle Name}}2 call SomeFunction()

" Teardown: {{"{{{"}}1
let &cpo = s:save_cpo

" Misc: {{"{{{"}}1
" vim: set ft=vim ts=2 sw=2 tw=78 et fdm=marker:
{{- end -}}
