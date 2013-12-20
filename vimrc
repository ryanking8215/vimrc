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
set background=dark
set cursorline
"set autochdir
set ts=8
set shiftwidth=4
set softtabstop=4

set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
 
" vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'plasticboy/vim-markdown'
Bundle 'matchit.zip'
Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Lucius'
Bundle 'majutsushi/tagbar'
"Bundle 'taglist.vim'
Bundle 'YankRing.vim'
"Bundle 'jsbeautify'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vimwiki'
Bundle 'jnwhiteh/vim-golang'
Bundle 'ryanking8215/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'
Bundle 'mattn/emmet-vim'
Bundle 'godlygeek/tabular'
Bundle 'jelera/vim-javascript-syntax'
"Bundle 'vimplugin/project.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
"Bundle 'vim-scripts/google.vim'
 
filetype plugin indent on     "required! 

map 0 ^

nmap <F2> <ESC>:cope<CR>
nmap <F3> <ESC>:vertical diffsplit<SPACE>
nmap <F4> <ESC>:grep<SPACE>
nmap <F5> <ESC>:make<CR>
nmap <F7> <ESC>:shell<CR>
nmap <F8> <ESC>:NERDTreeToggle<CR>
nmap <F9> <ESC>:TagbarToggle<CR>

color lucius
"LuciusLight
"

" Powerline {{{
let g:Powerline_symbols = 'unicode'
"let g:Powerline_colorscheme = 'skwp'
let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_symbols_override = {
			"\ 'BRANCH': [0x2213],
			"\ 'LINE': 'L',
			"\ }
" }}}

nmap <leader>tt <Plug>VimwikiToggleListItem

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" YCM
let g:ycm_global_ycm_extra_conf = '~/Documents/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

autocmd FileType c,cpp,javascript set shiftwidth=4 | set expandtab

" markdown
au BufRead *.md set ft=mkd
let g:vim_markdown_folding_disabled=1
