filetype plugin indent on

"vi互換機能を無効化
if ! &compatible | set nocompatible | endif

"pluginの管理
"---------------------vim-plug  ------------------------------------------------
"vim-plugがなかったら自動でインストール
if has('vim_starting')
  if !filereadable(expand('~/.vim/autoload/vim-plug/plug.vim'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/autoload/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/autoload/vim-plug/')
    call system('cp .vim/autoload/vim-plug/plug.vim .vim/autoload/')
    source ~/.vimrc
    PlugInstall
  end
endif
"let's run PlugInstall !
call plug#begin('~/.vim/plugged')
  "color schema{{{
    "Plug 'https://github.com/w0ng/vim-hybrid'
    Plug 'https://github.com/nanotech/jellybeans.vim'
    "Plug 'tomasr/molokai'
  "}}}
  Plug 'scrooloose/nerdtree'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'leafgarland/typescript-vim'
call plug#end()
"---------------------------------------------------------------------------

"文字コード設定
scriptencoding utf-8

"syntax 有効化
syntax on

"colorschemeの設定
colorscheme jellybeans

"括弧入力時に対応する括弧を表示
set showmatch

"バックアップを取らない
set nobackup

"windowのtitle変更
set title

"行数を表示
set number

"右下にruler(カソールの位置を示すやつ)の表示
set ruler
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

"検索文字列のハイライト有効化
set hlsearch

"tab幅の設定
set tabstop=2

"TabをSpaceにする
set expandtab

set smartindent

"カソール位置を中央に保つ
set scrolloff=10

"不可視文字の可視化{{{
  set list
  set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"}}}

"netrw は常にtree view
let g:netrw_liststyle =3

"'o'でファイルを開くときは常に下側に開く
let g:netrw_alto = 1

"検索時に先頭に戻らない
set nowrapscan

"コピペできるようにする
"+clipboardの場合
if has('unnamedplus')
  set clipboard=unnamedplus
endif
set shiftwidth=4

"C-a, C-e で行頭行末に移動{{{
  inoremap <C-a> <ESC>^i
  inoremap <C-e> <ESC>$i
  nnoremap <C-a> <Home>
  nnoremap <C-e> <End>
"}}}

"表示行単位で移動{{{
  nnoremap j gj
  onoremap j gj
  xnoremap j gj
  nnoremap k gk
  onoremap k gk
  xnoremap k gk
  nnoremap <Down> gj
  onoremap <Down> gj
  xnoremap <Down> gj
  nnoremap <Up> gk
  onoremap <Up> gk
  xnoremap <Up> gk
"}}}

"マップ定義{{{
  "map <F2> <ESC>:tabprevious<CR>
  "map <F3> <ESC>:tabnext<CR>
  "map <F4>:tabclose<CR>
"}}}

"NERDTree設定{{{
  let g:NERDTreeMouseMode=3
  map <C-n> :NERDTreeToggle<CR>
  autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}
"typescript-vim{{{
  let g:typescript_indent_disable = 1
"}}}

"OSごとの設定
if system("uname")=="Linux\n"
    "Linux
elseif system("uname")=="Darwin\n"
    "Mac
elseif has("win32")
  "Windows
  "ディレクトリパスの指定に/を使えるようにする
  set shellslash
endif
