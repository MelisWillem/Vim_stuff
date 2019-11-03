" disable auto_complete in denite
"-call deoplete#custom#option('auto_complete', v:false)

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Denite {{{
" Change file_rec command.
call denite#custom#var('file\rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '--ignore=*.pyc', '-g', ''])

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ 'K',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ 'L',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Change sorters.
call denite#custom#source(
      \ 'file/rec', 'sorters', ['sorter_sublime'])

" Change default prompt
call denite#custom#option('default', 'prompt', '➤ ')

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

nnoremap <space> :Denite file <cr>

