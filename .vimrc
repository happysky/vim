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
"
Plugin 'scrooloose/nerdtree' "文件列表
Plugin 'kien/ctrlp.vim' "模糊查找文件
Plugin 'jiangmiao/auto-pairs' "自动匹配，括号补全
Plugin 'Valloric/YouCompleteMe' "自动匹配，括号补全
Plugin 'marijnh/tern_for_vim' "
Plugin 'vim-syntastic/syntastic' "
Plugin 'pangloss/vim-javascript' "

" original repos on github
" ...
call vundle#end()

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nerdtree配置开始

map <F2> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
"当打开vim且没有文件时自动打开NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"当vim打开目录时候自动打开NERDTree
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"当只剩一个NERDTree时自动退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"忽略文件
let NERDTreeIgnore=['\.pyc','\.gz$','\.zip$','\.jpeg$','\.jpg']

"nerdtree配置结束

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"youCompleteMe配置开始

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

"回车即选中当前项"
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'

"上下左右键行为"
inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

"youCompleteMe配置结束

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
"ctrlp设置
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

