"十字キーの無効化"
function! HardMode ()
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>
endfunction

"十字キーの無効化解除"
function! EasyMode ()
    noremap <Up> <Up>
    noremap <Down> <Down>
    noremap <Left> <Left>
    noremap <Right> <Right>
endfunction

command! HardMode call HardMode ()
command! EasyMode call EasyMode () 

"行番号の表示"
set number
""tabはスペース4つ分
set tabstop=4
set softtabstop=4
"tabで半角スペースで挿入する"
set expandtab
""Vimが自動で生成するtabをスペース4つ分にする"
set shiftwidth=4
"改行時、自動でインデント"
set smartindent
""オートインデントをオン
set autoindent
"空白文字の可視化"
set list
""ファイルの保存をしていなくても別のファイルを開けるようにする"
set hidden
set history=50
"文字のないところにカーソル移動できるようにする"
set virtualedit=block
"hjklの折り返し設定
set whichwrap=b,s,h,l,<,>,[,]
"バックスペースを制限無しにする"
set backspace=indent,eol,start
set wildmenu
"set clipboard+=unnamedplus
""単語補完の入力候補の最大数"
set pumheight=10
set showmode
set wildmode=list:full
set laststatus=2

inoremap jj <Esc>
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

set pastetoggle=<F12>


inoremap jj <ESC>`^

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

filetype plugin indent on
augroup FlleIndent
  autocmd FileType c set cindent
  autocmd FileType cpp set cindent
augroup END

let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
    execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand("~/.vim")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'


  " toml を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


syntax on
colorscheme badwolf


" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 10
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#lock_buffer_name_pattern = ''
let g:neocomplete#enable_fuzzy_completion = 0
" text mode is necessary for look
" But it is not useful for code writing because it convert like:
" NeoBundle to Neobundle.
let g:neocomplete#text_mode_filetypes =
      \ {'hybrid': 1, 'text':1, 'help': 1, 'gitcommit': 1, 'gitrebase':1,
      \  'vcs-commit': 1, 'markdown':1, 'textile':1, 'creole':1, 'org':1,
      \  'rdoc':1, 'mediawiki':1, 'rst':1, 'asciidoc':1, 'prod':1,
      \  'plaintex':1, 'mkd': 1, 'html': 1,
      \  'vim':0, 'sh':0, 'javascript':0, 'perl':0}
let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'
"inoremap <expr> <TAB>  pumvisible() ? '\<C-n>' : '\<TAB>'
"inoremap <expr> <TAB> pumvisible() ? '\<C-n>' : neocomplete#start_manual_complete()
"inoremap <expr> <A-y>  neocomplete#close_popup()
"inoremap <expr> <A-e>  neocomplete#cancel_popup()
"inoremap <expr> <A-l>  neocomplete#complete_common_string()
"inoremap <expr> <A-u>  neocomplete#undo_completion()
" }}}

