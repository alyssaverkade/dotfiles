call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-buftabline'
call plug#end()
set completeopt=noinsert,menuone,noselect
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set number relativenumber
set showtabline=2
set matchtime=2
set autoread
set magic
set smartcase
set ignorecase
set showmatch
set incsearch
set gdefault
set hidden
set inccommand=split
set lazyredraw
set noswapfile
set updatetime=100
set shortmess+=c
set cmdheight=2
set nobackup
set nowritebackup
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
set title
set colorcolumn=+1
set textwidth=120
set synmaxcol=400
set notimeout
set ttimeout
set ttimeoutlen=10
set background=dark
let mapleader = " "
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:gruvbox_contrast_dark = 'hard'
let g:rainbow_active = 1
let g:gruvbox_italic=1
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \     [ 'blame' ]
      \   ]
      \ },
      \ 'component_function': {
      \ 'blame': 'LightlineGitBlame',
      \ 'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
colorscheme gruvbox
" general key bindings
nnoremap / /\v
vnoremap / /\v
nn <silent> <F1> :Explore <CR>
nn <leader>/ :FZF <CR>
nn <leader>bb :Buffers<CR>
nn <leader>evo :e $MYVIMRC <CR>
nn <silent> K :call <SID>show_documentation()<CR>
nm <silent> gd <Plug>(coc-definition)
nm <silent> gy <Plug>(coc-type-definition)
nm <silent> <C-]> <Plug>(coc-implementation)
nm <silent> gr <Plug>(coc-references)
ino <silent> <expr> <TAB> ExpandCompletions()
" expand snippets inline
ino <silent><expr> <C-space> coc#_select_confirm()
nm <silent> [c <Plug>(coc-diagnostic-prev)
nm <silent> ]c <Plug>(coc-diagnostic-next)
" lifted from sjl's vimrc
" who got it from one Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
  augroup END
autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp call Formatonsave()
" autocmd BufWritePre * %s/\s\+$//e
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/src/llvm/tools/clang/tools/clang-format/clang-format.py
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 60 ? blame : ''
endfunction

" completion is insanity
function! ExpandCompletions()
  if pumvisible()
    if coc#expandableOrJumpable()
      return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" 
    else
      return "\<C-n>"
    endif
  else
    call coc#refresh()
    return "\<Tab>"
  endif
endfunction

" abbreviations
iabbrev taht that
iabbrev teh  the
" annihilate the concept of nature
iabbrev ancn ⚧
" type math easily with this one simple trick!
silent! digr te 8707 " existential quantification
silent! digr fa 8704 " universal quantification
silent! digr es 8709 " empty set
silent! digr eo 8712 " element of
silent! digr p 8719 " product of
silent! digr s 8721 " summation
silent! digr i 8734 " infinity
silent! digr I 8747 " integral
silent! digr pd 8706 " partial derivative
silent! digr co 8756 " consequence
silent! digr o 1783 " disconjunction
silent! digr a 1784 " conjunction
silent! digr ip 8594 " implication
silent! digr S 8834  " subset
silent! digr Ps 8838 " proper subset
