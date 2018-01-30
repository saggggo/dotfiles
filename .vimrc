set encoding=utf-8
scriptencoding utf-8
"↑文字コード設定は最初（順番変えちゃだめ)

if ! &compatible | set nocompatible | endif                                     "vi互換機能の無効化
filetype plugin indent on                                                       "filetypeの検出の有効化
set fileformats=unix,dos,mac                                                    "改行コードの自動認識

"general
syntax on                                                                       "syntax 有効化
set autoread                                                                    "開いてるファイルに変更があったらリロード
set showmatch                                                                  "括弧入力時の対応する括弧の表示
set nobackup                                                                    "バックアップしない
set ambiwidth=double                                                            "文字幅が未定義のものを2文字として表示
set backspace=indent,eol,start                                                  "backspaceで改行,インデントの削除可
set hidden                                                                      "bufferを保存せずに移動可
set colorcolumn=80                                                              "80文字でカラムライン

"command
set wildmenu                                                                    "commandのtab補完有効化
"set wildmode=longest:list,full
set wildmode=list:longest                                                       "command補完時リスト表示かつ最長マッチ
set history=10000                                                               "コマンド履歴10000件

"view
set title                                                                       "windowのタイトル変更
set number                                                                      "行数表示
set ruler                                                                       "右下のかソール位置を示すやつ表示
set cursorline                                                                  "カソール行の強調
set scrolloff=10                                                                "カソール位置を中央に保つ
set showtabline=2                                                               "tabを常に表示 tabよりbuffer使う
set list                                                                        "不可視文字を表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%                  "表示する不可視文字を設定

"search
set incsearch                                                                   "incremental検索
set hlsearch                                                                    "検索文字のハイライト
set nowrapscan                                                                  "検索時に先頭に戻らない
set ignorecase                                                                   "小文字検索の場合=>大文字/小文字の区別なし
set smartcase                                                                    "大文字検索の場合=>大文字/小文字の区別あり

"edit
set autoindent                                                                  "インデントの有効化
set smartindent                                                                 "改行時自動indent
set expandtab                                                                   "tabをスペースにする
set tabstop=1                                                                   "tabの表示幅
set shiftwidth=0                                                                "自動indentの幅
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
"bufferの移動
nnoremap  <F2>    :bp<cr>
onoremap  <F2>    :bp<cr>
xnoremap  <F2>    :bp<cr>
nnoremap  <F3>    :bn<cr>
onoremap  <F3>    :bn<cr>
xnoremap  <F3>    :bn<cr>

"GUI
set mouse=a                                                                     "マウス有効化
set clipboard&                                                                  "clipboardにアクセス
set clipboard^=unnamed,unnamedplus                                              "clipboardにアクセス
"set clipboard=unnamedplus


"スペルチェック
"set spell
"set spelllang=en,cjk
