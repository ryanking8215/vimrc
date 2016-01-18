" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :
"
" Basic {
syn on
set t_Co=256
set nu
syn on
set ruler
set wildmenu
set fileencodings=utf-bom,utf-8,gb2312,default
set smartindent
set backspace=2
set hlsearch
set laststatus=2
"set background=dark
set cursorline
"set autochdir
set ts=4
set shiftwidth=4
set softtabstop=4
"set cc=81
let mapleader = ','
" working is OS X
set clipboard=unnamed

" window
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }

" Vundle {
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Plugin List
Plugin 'vim-airline/vim-airline'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'matchit.zip'
Plugin 'jiangmiao/auto-pairs'
Plugin 'plasticboy/vim-markdown'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'

"Bundle 'YankRing.vim'
"Bundle 'jsbeautify'
"Bundle 'vimwiki'
"Bundle 'jnwhiteh/vim-golang'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'tpope/vim-surround'
"Bundle 'mattn/emmet-vim'
"Bundle 'SirVer/ultisnips'
"Bundle 'jelera/vim-javascript-syntax'
"Bundle 'vimplugin/project.vim'
"Bundle 'nathanaelkane/vim-indent-guides'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     "required!
" }

" Theme {
color lucius
LuciusDark
" }

" 各种组件设置 {
" ctrlp {
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" }

" airline {
let g:airline#extensions#tabline#enabled=0
"let g:airline_powerline_fonts=1
"let g:Powerline_symbols = 'fancy'
"let Powerline_symbols='compatible'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
"" unicode symbols
"let g:airline_left_sep = '>'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '<'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" }

" neocomplete {
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

set completeopt+=longest,menuone
let g:neocomplete#enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

"let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\)\w*'
" }

" jedi-vim {
let g:jedi#popup_select_first=0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
" }

" neosnippet {
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif
" }

" markdown {
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled=1
" }

" flake8 {
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

let flake8_error_marker='EE'
let flake8_warning_marker='WW'
let flake8_pyflake_marker=''
let flake8_complexity_marker=''
let flake8_naming_marker=''

highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
" }

" }

" 各种文件设置 {
au BufNewFile,BufRead *.py
			\ setlocal tabstop=4 |
			\ setlocal softtabstop=4 |
			\ setlocal shiftwidth=4 |
			\ setlocal textwidth=79 |
			\ setlocal expandtab |
			\ setlocal autoindent |
			\ map <buffer> <leader>pf :call Flake8()<CR> |

au FileType c,cpp
			\ setlocal tabstop=4 |
			\ setlocal softtabstop=4 |
			\ setlocal shiftwidth=4 |
			\ setlocal expandtab |

au BufNewFile,BufRead *.js, *.html, *.css
			\ setlocal tabstop=2 |
			\ setlocal softtabstop=2 |
			\ setlocal shiftwidth=2 |

" 标注错误的whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" }

" Shortkey {
nmap 0 ^
nmap Y y$
" window
nnoremap <silent> <leader>ww <C-W><C-W>
nmap <silent> <leader>ws :sv<CR>
nmap <silent> <leader>wv :vs<CR>

nmap <silent> <leader>ft :NERDTreeToggle<CR>
nmap <silent> <leader>tt :TagbarToggle<CR>
nmap <silent> <leader>tc :cope<CR>
nmap <silent> <leader>th :nohlsearch<CR>

nmap <silent> <leader>sh :shell<CR>
nmap <leader>dv :vertical diffsplit<space>
nmap <leader>ss :grep<space>

" make
nmap <silent> <leader>mm :make<CR>
nmap <silent> <leader>mc :make clean<CR>
nmap <leader>mi :make install<CR>
nmap <leader>mf :make -f<space>

" git
nmap <silent> <leader>gs :Gstatus<CR>
nmap <leader>gg :Git<space>

" } 

