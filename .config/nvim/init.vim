call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'OmniSharp/omnisharp-vim'
Plug 'bagrat/vim-buffet'
Plug 'ledger/vim-ledger'
Plug 'tpope/vim-abolish'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'kkoomen/vim-doge'
Plug 'wellle/targets.vim'
Plug 'wellle/visual-split.vim'
Plug 'Raimondi/delimitMate'
Plug 'farmergreg/vim-lastplace'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

Plug 'ryanoasis/vim-devicons'
call plug#end()
set t_Co=256
set completeopt=noinsert,menuone,noselect
set conceallevel=0
set termguicolors
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
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
set updatetime=25
set shortmess+=c
set cmdheight=2
set nobackup
set nowritebackup
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
set title
set notimeout
set ttimeout
set ttimeoutlen=10
set background=dark
let mapleader = " "
let g:vimwiki_list = [{
      \ 'path':'~/vimwiki',
      \ 'ext': '.md',
      \ 'syntax': 'markdown',
      \ }]
let g:OmniSharp_server_stdio = 1
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_options = [{"template" :  "~/share/note-template.tpl"}]
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:rustfmt_autosave = 1
let g:gruvbox_contrast_dark = 'hard'
let g:rainbow_active = 1
let g:gruvbox_italic=1
let g:gruvbox_improved_warnings=1
let g:buffet_use_devicons = 1
let g:gruvbox_italicize_strings=1
let g:buffet_separator = " "
let g:buffet_use_devicons = 1
let g:buffet_tab_icon = "\uf00a "
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
      \   'right': [
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \     [ 'blame' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'blame': 'LightlineGitBlame',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filesymbol': 'FileSymbol',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }
let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type = { 'buffers': 'tabsel' }
colorscheme gruvbox
" general key bindings
nn <silent> <F1> :Explore <CR>
nn <leader>/ :FZF <CR>
nn <leader>b :Buffers<CR>
nn <leader>s :VSSplitAbove<CR>
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
sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
  autocmd!
  autocmd FileType cs set signcolumn=yes
  autocmd CursorHold *.cs call OSCountCodeActions()
augroup END
function! OSCountCodeActions() abort
  if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
  if !OmniSharp#IsServerRunning() | return | endif
  let opts = {
  \ 'CallbackCount': function('s:CBReturnCount'),
  \ 'CallbackCleanup': {-> execute('sign unplace 99')}
  \}
  call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
  if a:count
    let l = getpos('.')[1]
    let f = expand('%:p')
    execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
  endif
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd BufWritePre * %s/\s\+$//e
function! FmtRust()
  let current_pos = getpos(".")
  :%! rustfmt
  call setpos(".", current_pos)
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! FileSymbol()
  return WebDevIconsGetFileTypeSymbol()
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
" ∃x, ∀y { x ∈ R, y ∈ Z | ... }
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
