syntax on

"vi互換機能を無効化
if ! &compatible | set nocompatible | endif
scriptencoding utf-8

"括弧入力時に対応する括弧を表示
set showmatch

"カソール行の強調
set cursorline
"backspaceで改行やインデントも削除可能
set backspace=indent,eol,start
"indentの有効化
set autoindent
"mouseモード有効化
set mouse=a
" C-a, C-e で行頭行末に移動{
inoremap <C-a> <ESC>^i
inoremap <C-e> <ESC>$i
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
"}
"マップ定義{{{a
"map <F2> <ESC>:tabprevious<CR>
"map <F3> <ESC>:tabnext<CR>
"map <F4>:tabclose<CR>
"}}}
"}}}
set title
set number
set tabstop=2   "tab幅の設定
set smartindent
set expandtab   "TabをSpaceにする
set list        "不可視文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"netrw は常にtree view
let g:netrw_lifestyle =4 
"'o'でファイルを開くときは常に下側
let g:netrw_alto = 1

set nowrapscan
set clipboard=unnamed,autoselect
set shiftwidth=4
