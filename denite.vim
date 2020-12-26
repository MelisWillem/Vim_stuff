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
call denite#custom#var('file/rec', 'command',
            \ ['rg', '--files', '--glob', '!.git'])

" Change mappings.
" I really need to find out if these are even required
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

" Change ignore_globs
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

" Change default prompt
call denite#custom#option('default', 'prompt', '➤ ')

"" some extra stuff I found online
" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
            \ 'auto_resize': 1,
            \ 'direction': 'rightbelow',
            \ 'winminheight': '10',
            \ 'highlight_mode_insert': 'Visual',
            \ 'highlight_mode_normal': 'Visual',
            \ 'prompt_highlight': 'Function',
            \ 'highlight_matched_char': 'Function',
            \ 'highlight_matched_range': 'Normal'
            \ }}
" Loop through denite options and enable them
function! s:profile(opts) abort
    for l:fname in keys(a:opts)
        for l:dopt in keys(a:opts[l:fname])
            call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
        endfor
    endfor
endfunction
call s:profile(s:denite_options)

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--smart-case', '--follow', '--hidden', '--vimgrep', '--heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <leader>f :Denite -split=floating -winrow=1 file <cr>
nnoremap <C-n> :Denite  -start-filter -split=floating -winrow=1 file/rec<cr>
nnoremap <C-p> :DeniteProjectDir -start-filter -split=floating -winrow=1 file/rec grep:::!<CR>
