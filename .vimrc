set encoding=utf-8
scriptencoding utf-8
"↑文字コード設定は最初（順番変えちゃだめ)

if ! &compatible | set nocompatible | endif                                     "vi互換機能の無効化
filetype plugin indent on                                                       "filetypeの検出の有効化
set fileformats=unix,dos,mac                                                    "改行コードの自動認識

set runtimepath+=$HOME/dotfiles/vimrtp/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/dotfiles/vimrtp')
    call dein#begin('$HOME/dotfiles/vimrtp')
    call dein#add('$HOME/dotfiles/vimrtp/repos/github.com/Shougo/dein.vim')
    call dein#add('airblade/vim-gitgutter')                                     "行数の左にgitの変更を表示
"    call dein#add('rhysd/accelerated-jk')                                      "カーソル移動高速化
    call dein#add('nathanaelkane/vim-indent-guides')                            "カーソル移動高速化
    call dein#add('elzr/vim-json')                                              "json highlight
    call dein#end()
    call dein#save_state()
endif

"general
syntax on                                                                       "syntax 有効化
set autoread                                                                    "開いてるファイルに変更があったらリロード
set showmatch                                                                  "括弧入力時の対応する括弧の表示
set nobackup                                                                    "バックアップしない
set ambiwidth=double                                                            "文字幅が未定義のものを2文字として表示
set backspace=indent,eol,start                                                  "backspaceで改行,インデントの削除可
set hidden                                                                      "bufferを保存せずに移動可
set visualbell
set updatetime=250                                                              "update 250ms

"command
set wildmenu                                                                    "commandのtab補完有効化
set wildmode=list:longest                                                       "command補完時リスト表示かつ最長マッチ
set history=10000                                                               "コマンド履歴10000件

"view
colorscheme industry
set title                                                                       "windowのタイトル変更
set showmode                                                                    " -- INSERT -- 等を表示
set showcmd                                                                     " 一番下にコマンドを表示
set number                                                                      "行数表示
set ruler                                                                       "右下のかソール位置を示すやつ表示
set cursorline                                                                  "カソール行の強調
set scrolloff=10                                                                "カソール位置を中央に保つ
set showtabline=2                                                               "tabを常に表示 tabよりbuffer使う
set colorcolumn=80                                                              "80文字でカラムライン
set wrap                                                                        "行が長いとき折り返す
set list                                                                        "不可視文字を表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%                  "表示する不可視文字を設定
set laststatus=2                                                                "下のstatuslineを常に表示
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}

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
set tabstop=4                                                                   "tabの表示幅, tab入力時のspaceの数
set shiftwidth=0                                                                "自動indentの幅
set splitbelow                                                                  "画面分割下側
set splitright                                                                  "画面分割右側

"GUI
set mouse=a                                                                     "マウス有効化
set clipboard&                                                                  "clipboardにアクセス
set clipboard^=unnamed,unnamedplus                                              "clipboardにアクセス
set nomousefocus                                                                "マウスでfocusを移動しない

"keymap
"bufferの移動
nnoremap  <F2>    :bp<cr>
onoremap  <F2>    :bp<cr>
xnoremap  <F2>    :bp<cr>
nnoremap  <F3>    :bn<cr>
onoremap  <F3>    :bn<cr>
xnoremap  <F3>    :bn<cr>
"表示行単位で移動
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

"plugin specific configuration
let g:gitgutter_map_keys = 0                                                    "git-gutterのkeymap off
let g:indent_guides_enable_on_vim_startup = 1                                   "indent-guide deafult on
let g:indent_guides_guide_size=1                                                "indent-guide size 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']                    "indent-guide helpとnerdtree off
let g:indent_guides_default_mapping = 0                                         "indent-guide のkeymap off

"old
"set spell                                                                       "スペルチェック
"set spelllang=en,cjk

