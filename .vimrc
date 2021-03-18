set nocompatible  " 关闭 vi 兼容模式
set backspace=2
syntax enable
syntax on " 语法高亮
set number " 设置行号
set cursorline  " 突出显示当前行
set hlsearch " 高亮搜索
set incsearch  " 增量搜索，跳转到第一个匹配

" 按键映射
map  R :source $MYVIMRC<CR><CR>



" tab
set expandtab  " 将 tab 转化为指定数目的空格
set tabstop=4  " tab 本身代表几个空格，即 \t = 4 个空格
set softtabstop=4  " 在进行编辑时，如 <tab> <sp>，所使用的字符数
set shiftwidth=4  " >> 和 << 移动 4 个单位
set autoindent  " 换行自动缩进
set smartindent  " python 自动缩进
retab!  " 重新替换 \t


set fileencodings=utf-8,gb2312,gbk,gb18030 "设置文件编码
set termencoding=utf-8
"set encoding=utf-8

" F5 运行 python, F6 调试
map <F5> :call CompileRun()<CR><CR>
map <F6> :call CompileDebug()<CR><CR>

func! CompileRun()
    exec "w"
    if &filetype == "python"
        exec "! python %"
    endif
endfunc


func! CompileDebug()
    exec "w"
    if &filetype == "python"
        exec "! python -m pdb %"
    endif
endfunc
