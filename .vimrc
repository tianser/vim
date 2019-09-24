set nu
set tabstop=4
set shiftwidth=4              "换行插入4个字符宽
set expandtab 				  "将Tab键转换为空格

scriptencoding utf-8
set encoding=utf-8            "设置编码格式

set foldmethod=manual          "根据手动进行折叠
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
Plugin 'mileszs/ack.vim'        "全局搜索代码
Plugin 'tomlion/vim-solidity'   "solidity
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme elflord 

"ag setting
let g:ackprg = 'ag --nogroup --nocolor --column'
map <c-f> :Ack<space>

"YouCompleteMe YCM setting 
let g:ycm_cache_omnifunc=0         "关闭缓存
let g:ycm_collect_identifiers_from_tags_files=0 "开启 YCM 基于标签引擎
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
"最小自动触发补全的字符大小设置为 2 
let g:ycm_min_num_of_chars_for_completion = 2 
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
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.go,*.js,*.sol call tagbar#autoopen()
"tagbar setting end 

"ctrlp setting start 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|svn|pyc|o|a)$' 
"ctrlp setting start 

"nerdtree setting start 
"打开vim，自动打开NERDTree
autocmd VimEnter *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.py,*.go,*.js,*.sol NERDTree
"打开vim,自动打开NERDTree并执行ctrl+w
autocmd VimEnter * wincmd w
"目录箭头 显示箭头:1  传统+-|号: 0
"let NERDTreeDirArrows=1
let NERDTreeDirArrowExpandable = "+"
let NERDTreeDirArrowCollapsible = "▼"
"let NERDTreeWinPos='right'
let NERDTreeWinPos='left'
"自动忽略一下文件的显示
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp', 'tags', 'cscope*']
"显示行号
let NERDTreeShowLineNumbers=1
"是否显示隐藏文件
let NERDTreeShowHidden=0
"设置宽度
let NERDTreeWinSize=30
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭; ps：暂不生效
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")| q! | endif
"nerdtree setting end 

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst 
   set nocsverb
   "set dir=$PWD/cscope.out
   " add any database in current directory
   "if filereadable($dir)
   "   cs add $dir 
   "endif
   cs add $PWD/cscope.out 
   set ttimeoutlen=20
endif

"key mapped 
"normal模式下映射
nmap <F8> :NERDTreeToggle<CR> 
nmap <F9> :TagbarToggle<CR>
nmap <F10> :set paste<CR>
nmap <C-n> :set nu!<CR> 
    
"查找本 C 符号(可以跳过注释)
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
"查找本定义
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
"查找本函数调用的函数
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"查找调用本函数的函数
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
"查找本字符串
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
"查找本 egrep 模式
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
"查找本文件
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
"查找包含本文件的文件
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <C-p> :set paste!<cr> 

"Normal模式 + Visual模式 + Operator pending 模式
map <c-w> <c-w><c-w>

"map! Insert Only + command line 模式


if has("autocmd") 
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
endif
