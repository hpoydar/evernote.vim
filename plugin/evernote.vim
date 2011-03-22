"=============================================================================
" File: evernote.vim
" Author: Trae Robrock <trobrock@gmail.com>, Aaron McGeever <aaron@outright.com>
" Modified: Henry Poydar <henry@poydar.com>
" WebPage: http://github.com/trobrock/evernote-vim
" License: MIT
"
" Notes:
" * Requirement to controller.rb had to hardcoded, since all relative paths
" use current buffer, no time to investigate further

if !exists('g:evernote_vim_username')
  let g:evernote_vim_username = ''
endif

if !exists('g:evernote_vim_password')
  let g:evernote_vim_password = ''
endif

function! s:ListNotebooks()
  exec 'silent split evernote:notebooks'
  ruby $evernote.listNotebooks
  setlocal buftype=nofile bufhidden=hide noswapfile
  setlocal nomodified
endfunction

ruby << EOF
  require "~/dotfiles/vim/plugin/ruby/evernote-vim/controller.rb"
  $evernote = EvernoteVim::Controller.new
EOF

map <Leader>ev :call <SID>ListNotebooks()<CR>

