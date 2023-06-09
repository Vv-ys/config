"NOTE: install vim-plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


set completeopt=preview,menu                 "代码补全

set nobackup                                 "禁止生成临时文件
set noswapfile

set noerrorbells                             "关闭错误信息响铃
set vb t_vb=

set number                                   "显示行号

set nocompatible                             "使用vim自己的键盘模式，

syntax on                                    "语法高亮

set showmode                                 "左下角显示当前 vim 模式

set showcmd                                  "显示输入命令

set mouse=a                                  "鼠标可用

filetype indent on                           "侦测文件类型

set autoindent                               "回车后下一行自动缩进

set tabstop=4                                "一个tab键所占的列数

set shiftwidth=4                             "缩:进的列数

set expandtab                                "自动将tab键输入转化为相应的空格数

set relativenumber                           "相对行数

set cursorline                               "编辑行下划线

set linebreak                                "换行显示时不把一个单词拆开，遇到指定的符号（比如空格，连词号和其他标点符号）才换行

set scrolloff=5                              "将光标位置设置为第 5 行

set laststatus=2                             "显示状态栏（默认值为1，表示无法显示状态栏）

set ruler                                    "在状态栏显示光标当前位置，哪一行哪一列

set showmatch                                "遇到括号（小括号，中括号，大括号）时，自动高亮匹配的括号：

set hlsearch                                 "高亮显示搜索的匹配结果，输入结束时才显示

set incsearch                                "高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：

set ignorecase                               "搜索时忽略大小写

set smartcase                                "智能搜索

set autoread                                 "设置当文件被改动时自动载入

set listchars=tab:»·,trail:·                 "将tab键和多余的空格显示出来
set list

set wildmenu                                 "在命令模式下，按下 tab 键可以自动补全命令
set wildmode=longest:list,full

set smartindent                              "智能缩进

set copyindent                               "复制粘贴时保留原有的缩进
set foldmethod=manual                        "代码折叠
set nowrap                                   "不要换行
set encoding=utf-8 fileencodings=utf-8


"cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"fix delay
set ttimeout
set ttimeoutlen=1
set ttyfast

"Keyboard Map
let mapleader = "\<Space>"
noremap K 5k
noremap J 5j
noremap L $
noremap H ^
noremap gr %

nnoremap <c-]> :bn<CR>
nnoremap <Esc>s :w<CR>
nnoremap <Esc>n :bn<CR>
nnoremap <Esc>p :bp<CR>

"#######################################################################
"  Plug
"#######################################################################

call plug#begin()

"UI
Plug 'arzg/vim-colors-xcode'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
"Files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
"edit
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

"#######################################################################
"  Plugconfig
"#######################################################################
"--vim-lightline themes----
let g:lightline = {
            \ 'colorscheme': 'rosepine',
            \ }
" \ 'colorscheme': 'PaperColor',

"--theme----
" colorscheme xcodewwdc
" set bg=dark
colorscheme xcodelight
set bg=light

"--Startify-----
let g:startify_files_number = 5
let g:startify_session_autoload = 1
let g:startify_custom_header = [
            \'',
            \'',
            \'        ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀  ',
            \'      ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷ ',
            \'     ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ ',
            \'    ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ ',
            \'  ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ ',
            \' ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ ',
            \' ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ ',
            \' ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ ',
            \' ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ ',
            \' ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ ',
            \' ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ ',
            \' ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ ',
            \' ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ ',
            \'  ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃ ',
            \' ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ',
            \'',
            \'',
            \]

"--NERDTree----
nnoremap <leader>n :NERDTreeToggle<CR>

"--fzf----
nnoremap  <Leader>fh :History<CR>
nnoremap  <Leader>ff :Files<CR>
nnoremap  <Leader>fs :Colors<CR>
nnoremap  <Leader>fl :Rg<CR>
nnoremap  <Leader>fm :Marks<CR>
nnoremap  <Leader>fw :Lines<CR>
nnoremap  <Leader>fb :Buffers<CR>



""""""" autocomplete pairs
inoremap <silent>" ""<esc>:call HandlePair(0, "\"")<CR>
inoremap <silent>' ''<esc>:call HandlePair(0, "\'")<CR>
inoremap <silent>( ()<esc>:call HandlePair(1, "(")<CR>
inoremap <silent>[ []<esc>:call HandlePair(1, "[")<CR>
inoremap <silent>{ {}<esc>:call HandlePair(1, "{")<CR>

" in visual mode surround text with paired characters
vnoremap <silent><Space>" <esc>:call SurroundText("\"", "\"")<CR>
vnoremap <silent>' <esc>:call SurroundText("\'", "\'")<CR>
vnoremap <silent>( <esc>:call SurroundText("(", ")", 1)<CR>
vnoremap <silent>[ <esc>:call SurroundText("[", "]", 1)<CR>
vnoremap <silent>{ <esc>:call SurroundText("{", "}", 1)<CR>
vnoremap <silent>) <esc>:call SurroundText("(", ")", 0)<CR>
vnoremap <silent>] <esc>:call SurroundText("[", "]", 0)<CR>
vnoremap <silent>} <esc>:call SurroundText("{", "}", 0)<CR>

" special handling for autocomplete pairs by yours truly
function! HandlePair(enter, key) abort
    " handle the next key press
    let nextChar = nr2char(getchar())
    if nextChar == "\<CR>" && a:enter
        :call feedkeys("i\<CR>\<esc>O")
    elseif nextChar == "\<tab>"
        if col(".") == col("$") - 1
            :call feedkeys("xa")
        else
            :call feedkeys("xi")
        endif
    elseif nextChar == ";"
        :call feedkeys("A;")
    elseif nextChar == "{" && a:key == "("
        :call feedkeys("A{")
    elseif nextChar == "\<esc>"
    " do nothing, already in normal mode
    else
        :startinsert
        :call feedkeys(nextChar)
    endif
endfunction

function! SurroundText(key, pair, firstOrLast) abort
    let start      = getpos("'<")
    let end        = getpos("'>")

    :let @t = a:key
    :call cursor(start[1],start[2])
    if start[2] == 1
        :normal ^
    endif
    :normal "tP
    :let @t = a:pair
    :call cursor(end[1],end[2]+1)
    :normal "tp
    if a:firstOrLast
        :call cursor(start[1],start[2])
    endif
endfunction


