au FileType php :set dict=~/.vim/dict/php.dict
au FileType css :set dict=~/.vim/dict/css.dict
au FileType javascript :set dict=~/.vim/dict/javascript.dict
au FileType html :set dict=~/.vim/dict/html.dict
set tabstop=2	"タブの範囲
set number		"行番号を出す
set cursorline	"カーソルの位置の背景色を変える
set scrolloff=8	"上下8行は視界を確保する
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"マウスを有効にする
if has('mouse')
	set mouse=a
endif
"□や○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
""""""""""""""""""""""""""""""
augroup vimrcEx
	autocmd!
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line('$') |
		\   exe "normal! g`\"" |
		\ endif
augroup END
" 補完の際の大文字小文字の区別しない
set infercase

" vim-over の設定
"" over.vim {{{

" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" }}}

set noswapfile




"プラグイン関係
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/vimfiles/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"囲み文字をいい感じに囲む
NeoBundle 'tpope/vim-surround'
"入力補完
NeoBundle 'Shougo/neocomplcache'
"コメント
"NeoBundle 'The-NERD-Commenter'
"unite
NeoBundle 'Shougo/unite.vim'
"filer
NeoBundle 'Shougo/vimfiler'
"再起動プラグイン
"NeoBundle 'tyru/restart.vim'
"カーソル移動
NeoBundle 'Lokaltog/vim-easymotion'
" テキストオブジェクトで置換
"NeoBundle 'kana/vim-operator-replace'
"NeoBundle 'kana/vim-operator-user'
"plugin repeat
"NeoBundle 'tpope/vim-repeat'
"置換可視化
"NeoBundle 'osyo-manga/vim-over'
"yank履歴
"NeoBundle 'LeafCage/yankround.vim'
"NeoBundle 'kien/ctrlp.vim'

" CakePHP 用
NeoBundle 'violetyk/cake.vim'

" HTML用
NeoBundle 'mattn/emmet-vim'

" 閉じかっこ勝手にやってくれる
NeoBundle 'Townk/vim-autoclose'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck



"vim-easymotion
nmap s <Plug>(easymotion-s2)
