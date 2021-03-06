"编码配置
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,cp936,ucs-bom,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

"编写文件时的配置"
filetype on
filetype plugin on
filetype plugin indent on

set smartindent
set nobackup
set noswapfile
set undodir=D:/.undodir
set expandtab
set tabstop=4
set shiftwidth=4
set wrap
set smarttab
set foldlevelstart=99
set foldmethod=indent
set autoread
set hlsearch
set incsearch
set gdefault
set complete=.,w,b,k,t,i
set completeopt=preview,menu

set exrc
set secure
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O

func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc

inoremap <TAB> <c-r>=SkipPair()<CR>
"界面设置"
set shortmess=atI
set number
set laststatus=2
set cmdheight=2
set background=dark
set cursorline
hi Cursorline cterm=NONE ctermbg=DarkGrey ctermfg=NONE guibg=NONE guifg=NONE
set guifont=Consolas:h12:cANSI

if has("syntax")
	syntax on
endif

if has("gui_running")
	winpos 500 80
	set lines=40 columns=120
	colorscheme solarized "Tomorrow-Night-Eighties

	set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    nmap <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=r <Bar>
            \set guioptions-=L <Bar>
        \else <Bar>
            \set guioptions+=m <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=r <Bar>
            \set guioptions+=L <Bar>
        \endif<CR>
	
else
	let g:isGUI=0
endif