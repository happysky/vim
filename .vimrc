"表示在编辑模式的时候按退格键的时候退回缩进的长度softtabstop
set softtabstop=4
"表示每一级缩进的长度shiftwidth
set sw=4
"Tab键宽度tabstop
set ts=4
set smarttab 
"编辑时将所有 Tab 替换为空格
set et
set expandtab
"保持上一行相同的缩进
set autoindent

"设置编码
set encoding=utf8
set langmenu=zh_CN.UTF-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030   

"使用256颜色,否则airline颜色无法显示
set t_Co=256

"设置不折行
set nowrap
" 显示行号
set number"
" 显示标尺
set ruler           
set nocompatible " 不要支持vi模式
syntax on " 支持语法高亮
filetype plugin indent on " 加载插件和支持缩进

"禁止生成临时文件
set nobackup
set noswapfile

"搜索忽略大小写
set ignorecase 


"set nocompatible               " be iMproved
"filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'

" My Bundles here:
Plugin 'scrooloose/nerdtree' "文件列表
Plugin 'kien/ctrlp.vim' "模糊查找文件
Plugin 'jiangmiao/auto-pairs' "自动匹配，括号补全
Plugin 'Valloric/YouCompleteMe' "自动匹配，括号补全
Plugin 'marijnh/tern_for_vim' "补全
Plugin 'vim-syntastic/syntastic' "语法检测
Plugin 'pangloss/vim-javascript' "
Plugin 'vim-airline/vim-airline' "底部状态栏
Plugin 'vim-airline/vim-airline-themes' "底部状态栏皮肤

call vundle#end()

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree配置开始
"scrooloose/nerdtree{{{{
    map <F2> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    "当打开vim且没有文件时自动打开NERDTree
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    "当vim打开目录时候自动打开NERDTree
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    "当只剩一个NERDTree时自动退出
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    "忽略文件
    let NERDTreeIgnore=['\.pyc$','\.gz$','\.zip$','\.jpeg$','\.jpg$']
    "显示隐藏文件
    let NERDTreeShowHidden=1
"}}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Valloric/YouCompleteMe{{{{
    "默认配置文件路径"
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

    "打开vim时不再询问是否加载ycm_extra_conf.py配置"
    let g:ycm_confirm_extra_conf=0

    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
    set completeopt=longest,menu

    "是否开启语义补全"
    let g:ycm_seed_identifiers_with_syntax=1

    "是否在注释中也开启补全"
    let g:ycm_complete_in_comments=1
    "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 0

    "开始补全的字符数"
    let g:ycm_min_num_of_chars_for_completion=2

    "补全后自动关机预览窗口"
    let g:ycm_autoclose_preview_window_after_completion=1

    " 禁止缓存匹配项,每次都重新生成匹配项"
    let g:ycm_cache_omnifunc=0

    "字符串中也开启补全"
    let g:ycm_complete_in_strings = 1

    "离开插入模式后自动关闭预览窗口"
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " 设置在下面几种格式的文件上屏蔽ycm
    let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'nerdtree' : 1,
          \}

    "回车即选中当前项"
    inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

    "上下左右键行为"
    inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "<Down>"
    inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "<Up>"
    inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "<PageDown>"
    inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "<PageUp>"

"}}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"kien/ctrlp.vim{{{{
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
    let g:ctrlp_extensions = ['funky']
"}}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-syntastic/syntastic{{{{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_javascript_checkers = ['jshint']    
"}}}}

"vim-airline/vim-airline{{{{
    let g:airline_theme="luna" 

    "这个是安装字体后 必须设置此项 
    "let g:airline_powerline_fonts = 1   

    "打开tabline功能,方便查看Buffer和切换，这个功能比较不错
    "我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1

    "设置切换Buffer快捷键
    noremap <C-N> :bn<CR>
    nnoremap <C-P> :bp<CR>

    " 关闭状态显示空白符号计数,这个对我用处不大
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
"}}}}
