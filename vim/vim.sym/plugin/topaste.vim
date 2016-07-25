"=============================================================================
" File: topaste.vim
" Author: Daniel Streby <daniel@dstreby.com>
" Credits: Forked from Carla Souza's 'podh' https://github.com/carlasouza/podh
" License: GPL3
"=============================================================================

function TOpaste(line1, line2)
  let g:html_use_encoding = "utf-8"
  let g:html_use_css = 1
  let g:html_number_lines = 0
  let current_color = g:colors_name
  let tmp_file = system('mktemp -u')
  let name = expand('%:t').".html"
  colorscheme default
  execute a:line1 . "," . a:line2 . "TOhtml" | exec "w ".tmp_file | exec "q!"
  execute "colorscheme ".current_color
  let res = system('vim-snip '.name." ".tmp_file)
  " exec "topleft 2new"
  " call append(0, tmp_file)
endfunction
command! -range=% TOpaste :call TOpaste(<line1>, <line2>)
