"vi互換機能の無効化
if ! &compatible | set nocompatible | endif

"文字コード設定
scriptencoding utf-8

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

augroup MyAutoCmd
  autocmd!
augroup END
" nvim specific
"set termguicolors

" dein.vim 自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone --depth 1 https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = expand('<sfile>:h').'/packages.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif


"filetypeの検出の有効化
filetype plugin indent on 

"改行コードの自動認識
set fileformats=unix,dos,mac

"文字幅が未定義のものを2文字として表示
set ambiwidth=single
"syntax 有効化
syntax on 

"開いてるファイルに変更があったらリロード
set autoread

"括弧入力時の対応する括弧の表示
set showmatch 

"バックアップしない
set nobackup 

"windowのタイトル変更
set title 

"commandline modeの補完を使いやすくする
set wildmenu
set wildmode=longest:list,full

"行数表示
set number

"右下のかソール位置を示すやつ表示
set ruler 

"カソール行の強調
set cursorline 

"backspaceで改行,インデントの削除可
set backspace=indent,eol,start 

"インデントの有効化
set autoindent 

"マウス有効化
set mouse=a 

"検索の改善{{{
  "小文字検索の場合=>大文字/小文字の区別なし
  "大文字検索の場合=>大文字/小文字の区別あり
  set ignorecase
  set smartcase
"}}}

"incremental検索
set incsearch

""検索文字のハイライト
set hlsearch 

"検索時に先頭に戻らない
set nowrapscan

"tab幅の設定{{{
  set tabstop=4
  set shiftwidth=0
"}}}

"tabをスペースにする
set expandtab

"改行時自動indent
set smartindent

"カソール位置を中央に保つ
set scrolloff=10

"不可視文字の可視化{{{
  set list
  set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
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

"clipboardにアクセス
set clipboard+=unnamedplus

"カラムライン
set colorcolumn=80

"スペルチェック
"set spell
"set spelllang=en,cjk


"netrw{{{
  ""常にtreeview
  let g:netrw_liststyle=3

  "oでファイルを開くときは常に下側
  let g:netrw_alto=1
"}}}

"tabを常に表示 tabよりbuffer使う
"set showtabline=2

"bufferを保存せずに移動可
set hidden

"bufferの移動
nnoremap  <F2>    :bp<cr>
onoremap  <F2>    :bp<cr>
xnoremap  <F2>    :bp<cr>
nnoremap  <F3>    :bn<cr>
onoremap  <F3>    :bn<cr>
xnoremap  <F3>    :bn<cr>
