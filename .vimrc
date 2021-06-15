"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'yggdroot/indentline'

Plug 'baskerville/vim-sxhkdrc'
Plug 'vim-python/python-syntax'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'mhinz/vim-startify'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber
set history=500

set nocompatible
syntax on

filetype plugin on
filetype indent on

let mapleader = ","

set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

set encoding=utf8

set nobackup
set nowb
set noswapfile

set smarttab
"set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=0 noexpandtab

autocmd FileType rust,python,json set tabstop=4 shiftwidth=4 expandtab
autocmd FileType markdown,html,javascript,typescript set tabstop=2 shiftwidth=2 expandtab
autocmd FileType gitcommit set colorcolumn=+1

set ai
set si
set wrap

set conceallevel=2
set concealcursor=""

" A smooth line for vertical splits
set fillchars+=vert:│

set spelllang=en_us,es

set background=dark
colorscheme delek

"
" -> Highlight
"

highlight LineNr ctermfg=Yellow
highlight CursorLineNr ctermfg=Blue

" I like it more when it's underlined red *shrug*
highlight clear SpellBad
highlight SpellBad term=underline cterm=underline ctermfg=9

" Make vertical splits be less of an eyesore
highlight clear VertSplit
highlight VertSplit term=bold ctermfg=White

"
" -> Mappings
"

" Maybe I'll want to suffer forcing me to use the vim movement keys when I get
" to have another keyboard. The K key is a pain still.
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" Moving through splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Shortcut to saving
map <leader>w :w<CR>

" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" Clear highligting
map <leader>/ :noh<CR>

imap jj k
imap JJ K

"
" -> Autocmd
"

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters= {
\   'python': ['flake8'],
\   'rust': ["rls"],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight clear SignColumn

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" TODO: Icons for these
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline_theme='wombat'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From: https://www.chrisatmachine.com/Neovim/08-fzf/

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:ultisnips_python_style = 'google'

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'personal-snippets']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 0

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'

let g:indentLine_bufNameExclude=['startify']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python-syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 0

let g:python_version_2 = 0
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_funcs_kwarg = 1
let g:python_highlight_exceptions = 1
"let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1

let g:vim_markdown_conceal_code_blocks = 0

let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = '~/.vim/session'

let g:startify_lists = [
\{ 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\{ 'type': 'files',     'header': ['   MRU']            },
\{ 'type': 'dir',       'header': ['   MRU '. getcwd()] },
\{ 'type': 'sessions',  'header': ['   Sessions']       },
\{ 'type': 'commands',  'header': ['   Commands']       },
\]

let g:startify_bookmarks = [
\   {'v': '~/.vimrc'},
\   {'n': '~/Notes/index.md'},
\   {'c': '~/.config'},
\]

let g:startify_custom_header = startify#pad([
\   '    ___                       ___     ',
\   '   /\__\          ___        /\__\    ',
\   '  /:/  /         /\  \      /::|  |   ',
\   ' /:/  /          \:\  \    /:|:|  |   ',
\   '/:/__/  ___      /::\__\  /:/|:|__|__ ',
\   '|:|  | /\__\  __/:/\/__/ /:/ |::::\__\',
\   '|:|  |/:/  / /\/:/  /    \/__/~~/:/  /',
\   '|:|__/:/  /  \::/__/           /:/  / ',
\   ' \::::/__/    \:\__\          /:/  /  ',
\   '  ~~~~         \/__/         /:/  /   ',
\   '                             \/__/    ',
\])

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
