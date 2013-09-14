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
set showmatch

set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
 
" vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'Markdown'
Bundle 'matchit.zip'
"Bundle 'snipMate'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Lucius'
"Bundle 'Tagbar'
"Bundle 'timgreen/vim-tagbar'
Bundle 'majutsushi/tagbar'
Bundle 'taglist.vim'
Bundle 'YankRing.vim'
Bundle 'jsbeautify'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ryanking8215/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnwhiteh/vim-golang'
Bundle 'SirVer/ultisnips'

"Bundle 'vim-scripts/Command-T'
 
filetype plugin indent on     "required! 

map 0 ^

nmap <F2> <ESC>:cope<CR>
nmap <F3> <ESC>:vertical diffsplit<SPACE>
nmap <F4> <ESC>:grep<SPACE>
nmap <F5> <ESC>:make<CR>
nmap <F7> <ESC>:shell<CR>
nmap <F8> <ESC>:NERDTreeToggle<CR>
nmap <F10> <ESC>:TagbarToggle<CR>

"color lucius
let g:solarized_termcolors=256
colorschem solarized

" Powerline {{{
let g:Powerline_symbols = 'unicode'
"let g:Powerline_symbols_override = {
			"\ 'BRANCH': [0x2213],
			"\ 'LINE': 'L',
			"\ }
" }}}

" YCM
"let g:ycm_global_ycm_extra_conf = '~/Documents/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
