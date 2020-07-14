language en_US
ru! defaults.vim                " Use Enhanced Vim defaults
aug vimStartup | au! | aug END  " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set wildmode=longest,list,full  " Better command line completion
set wildmenu

" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  set termguicolors           " Uncomment to allow truecolors on mintty
endif


" Vim Plug Start
call plug#begin('~/AppData/Local/nvim/plugged')

" Themes
" colorscheme
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Useful Plugins
" Plug 'valloric/youcompleteme'  " auto-completion
Plug 'jiangmiao/auto-pairs'    " auto-pairs
Plug 'ryanoasis/vim-devicons'  " pretty icons
Plug 'tpope/vim-surround'      " quotes edition
Plug 'tpope/vim-repeat'        " plugin repeation
Plug 'tpope/vim-commentary'    " `gcc` to comment a line
Plug 'Lokaltog/vim-easymotion' " quick jump
Plug 'terryma/vim-multiple-cursors'  " multi selection
Plug 'junegunn/vim-easy-align'       " Simple align
Plug 'kien/rainbow_parentheses.vim'  " color pairs

" text object
" 支持自定义文本对象
Plug 'kana/vim-textobj-user'
" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'
" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
Plug 'kana/vim-textobj-indent'


" Language highlight support
Plug 'godlygeek/tabular'
" For style highlighting
Plug 'sheerun/vim-polyglot'
" For Markdown
Plug 'plasticboy/vim-markdown'
" For Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Vim Plug End
call plug#end()


" Theme Settings
set background=dark
colorscheme onedark

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1


" 设置当文件被改动时自动载入
set autoread    
"从不备份  
set nobackup
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
" 禁止自动折叠
set nofoldenable
" 自动缩进
set autoindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 显示相对行号
set relativenumber
" 普通模式显示相对行号，插入模式绝对行号
autocmd! InsertEnter * :set norelativenumber
autocmd! InsertLeave * :set relativenumber

" 禁止生成临时文件
set nobackup
set noswapfile
" 搜索忽略大小写
set ignorecase

" 搜索逐字符高亮 
set hlsearch
set incsearch
" 行内替换
set gdefault
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 光标移动到buffer的顶部和底部时保持4行距离
set scrolloff=4
" 为C程序提供自动缩进
set smartindent


" Key mappings
let g:mapleader = ","   " set the `leader` key

" Go to home and end using capitalized directions
noremap H ^
noremap L $


" PluginsSettings:
" PythonMode: Python语法检查框架
" 开启警告
let g:pymode_warnings = 1
" 保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
" 显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
" 设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
" 使用python3
let g:pymode_python = 'python3'
" 使用PEP8风格的缩进
let g:pymode_indent = 1
" 代码折叠
let g:pymode_folding = 1
" 开启python-mode定义的移动方式
let g:pymode_motion = 1
" 不启用python-mode内置的python文档
let g:pymode_doc = 0
" 自动检测并启用virtualenv
let g:pymode_virtualenv = 1
" 使用python-mode运行python代码
let g:pymode_run = 1
let g:pymode_run_bind = '<Leader>r'
" 不使用python-mode设置断点
let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_bind = '<leader>b'
" 启用python语法检查
let g:pymode_lint = 1
" 修改后保存时进行检查
let g:pymode_lint_on_write = 1
" 编辑时进行检查
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
" 发现错误时不自动打开QuickFix窗口
let g:pymode_lint_cwindow = 1
" 侧边栏显示python-mode相关的标志
let g:pymode_lint_signs = 1
" 开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
" 高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" 高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all


" YouCompleteMe: 语句补全插件
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
" let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
" let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
" let g:ycm_complete_in_comments = 1
" let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
" let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
" let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
" let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
" let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项


" EasyMotion: 快速移动插件
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)


" EasyAlign: 快速对齐插件
vmap <Leader>a <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }


" RainbowParentheses: 彩色括号插件
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
