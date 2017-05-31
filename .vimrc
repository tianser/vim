set nu
set tabstop=4
set shiftwidth=4              "换行插入4个字符宽
set expandtab 				  "将Tab键转换为空格


set hlsearch                  " 搜索逐字符高亮
set syntax=on                 " 语法高亮 
set nocompatible              " be iMproved, required
filetype off                  " required
"set noeb                      " 设置输入错误提示声音

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'      "Plugin manage
Plugin 'fatih/vim-go'           "golang
Plugin 'Valloric/YouCompleteMe' "自动补全神器
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'      "函数、变量展示
Plugin 'scrooloose/nerdtree'    "展示目录及文件
Plugin 'tmhedberg/matchit'      "使用%在两个对应的字符间跳转
Plugin 'Raimondi/delimitMate'   "括号，等补全
Plugin 'kien/ctrlp.vim'         "快速查找文件
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme molokai

"YouCompleteMe YCM setting 
let g:ycm_cache_omnifunc=0         "关闭缓存
let g:ycm_collect_identifiers_from_tags_files=1 "开启 YCM 基于标签引擎
let g:ycm_global_ycm_extra_conf = '/root/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0  "打开vim时不再询问是否加载ycm_extra_conf.py配置  
let g:ycm_error_symbol = '>>'   "语法检测,不太准
let g:ycm_show_diagnostics_ui = 0
let g:ycm_python_binary_path = '/usr/bin/python2.7'
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_comments = 1  "补全注释
let g:ycm_complete_in_strings = 1   "字符串输入中也补全
let g:ycm_server_log_level = 'info' "设置ycm log等级
"let g:ycm_server_log_level = 'info' "设置ycm log等级
"let g:ycm_collect_identifiers_from_tags_files = 1 "会导致一直更新标签，python2 占用内存80%以上
"进入vim, 执行:YcmDebugInfo
"重启YCM， 执行: YcmRestartServer 
"YCM setting end


"UltiSnips setting 
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

"tagbar setting start
let g:tagbar_ctags_bin="/usr/bin/ctags"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"设置tagbar使用的ctags的插件，必须要设置正确
let g:tagbar_ctags_bin='/usr/bin/ctags'

"设置tagbar的窗口显示的位置，1:左边 0: 右边
let g:tagbar_left = 0
"设置tagbar的窗口宽度
"let g:tagbar_width=25
let g:tagbar_width=35
"自动打开tagbar
"let g:tagbar_autoshowtag = 1
"自动打开指定后缀的文件tagbar
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.go call tagbar#autoopen()
"tagbar setting end 

"ctrlp setting start 
let g:ctrlp_map = '<c-f>'
"ctrlp setting start 

"nerdtree setting start 
"打开vim，自动打开NERDTree
autocmd VimEnter *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.go NERDTree
"打开vim,自动打开NERDTree并执行ctrl+w
autocmd VimEnter * wincmd w
"let NERDTreeWinPos='right'
let NERDTreeWinPos='left'
"自动忽略一下文件的显示
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp']
"显示行号
let NERDTreeShowLineNumbers=1
"是否显示隐藏文件
let NERDTreeShowHidden=0
"设置宽度
let NERDTreeWinSize=30
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭; ps：暂不生效
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")| q! | endif
"nerdtree setting end 

"key mapped 
"normal模式下映射
nmap <F8> :NERDTreeToggle<CR> 
nmap <F9> :TagbarToggle<CR>
nmap <F10> :set paste<CR>
nmap <C-n> :set nu!<CR> 
"nmap <C-p> :set paste!<cr> 

"Normal模式 + Visual模式 + Operator pending 模式
map <c-w> <c-w><c-w>

"map! Insert Only + command line 模式

