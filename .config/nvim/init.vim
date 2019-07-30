call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
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
Plug 'raichoo/haskell-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'osyo-manga/vim-monster'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
call plug#end()
" go to last pos in file
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" autocmd BufWritePre * %s/\s\+$//e
set completeopt=noinsert,menuone,noselect
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set number relativenumber
set magic
set smartcase
set incsearch
set hidden
set noswapfile
set updatetime=100
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
let mapleader = " "
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:gruvbox_contrast_dark = 'hard'
let g:rainbow_active = 1
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" let g:rustfmt_autosave = 1
let g:gruvbox_italic=1
let g:cpp_class_scope_highlight = 1
" perf improvements
let g:gitgutter_log = 0
nnoremap <silent> <F1> :Explore <CR>
nnoremap <leader>/ :FZF <CR>
set background=dark
colorscheme gruvbox
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/src/llvm/tools/clang/tools/clang-format/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp call Formatonsave()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
