filetype plugin indent on

"vi互換機能を無効化
if ! &compatible | set nocompatible | endif

"syntax 有効化
syntax on

"文字コード設定
scriptencoding utf-8

"括弧入力時に対応する括弧を表示
set showmatch

"windowのtitle変更
set title

"行数を表示
set number

"カソール行の強調
set cursorline

"backspaceで改行やインデントも削除可能
set backspace=indent,eol,start

"indentの有効化
set autoindent

"mouseモード有効化
set mouse=a

"検索の大文字/小文字の区別を改善{{{
set ignorecase
set smartcase
"}}}

"tab幅の設定
set tabstop=2

set smartindent

"TabをSpaceにする
set expandtab

"不可視文字の可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"netrw は常にtree view
let g:netrw_lifestyle =4 
"'o'でファイルを開くときは常に下側
let g:netrw_alto = 1

set nowrapscan
set clipboard=unnamed,autoselect
set shiftwidth=4

" C-a, C-e で行頭行末に移動{{{
inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$i
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
"}}}

"マップ定義{{{
"map <F2> <ESC>:tabprevious<CR>
"map <F3> <ESC>:tabnext<CR>
"map <F4>:tabclose<CR>
"}}}

"vim-plug  
call plug#begin('~/.vim/plugged')
  Plug 'colors/molokai'
  Plug 'indent_guides'
  Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
call plug#end()

