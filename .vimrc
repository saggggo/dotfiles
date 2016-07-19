syntax on

set title
set number      
set tabstop=2   "tab幅の設定
set smartindent
set expandtab   "TabをSpaceにする
set list        "不可視文字の可視化
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set notitle "'vimを使ってくれてありがとう'を消す

"netrw は常にtree view
let g:netrw_lifestyle =4 
"'o'でファイルを開くときは常に下側
let g:netrw_alto = 1
