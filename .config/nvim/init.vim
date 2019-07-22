call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ck3g/vim-change-hash-syntax'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'raichoo/haskell-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
call plug#end()
autocmd BufEnter * call ncm2#enable_for_buffer()
" autocmd BufWritePre * %s/\s\+$//e
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone
set completeopt=noinsert,menuone,noselect
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set number relativenumber
set magic
set ignorecase
set hidden
set noswapfile
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
let mapleader= " "
let g:gruvbox_contrast_dark = 'hard'
let g:rustfmt_autosave = 1
let g:gruvbox_italic=1
let g:cpp_class_scope_highlight = 1
let g:LanguageClient_serverCommands = {
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'haskell': ['hie-wrapper'],
            \ 'ruby': ["~/.rbenv/shims/solargraph"],
            \ 'cpp': ['clangd', '--clang-tidy', '--completion-style=detailed', '--header-insertion=iwyu'],
            \ }
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <leader>/ :FZF <CR>
if !get(g:, 'tmux_navigator_no_mappings', 0)
  tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
  tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
  tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
  tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>
endif
if empty($TMUX)
  command! TmuxNavigateLeft call s:TmuxAwareNavigate('h')
  command! TmuxNavigateDown call s:TmuxAwareNavigate('j')
  command! TmuxNavigateUp call s:TmuxAwareNavigate('k')
  command! TmuxNavigateRight call s:TmuxAwareNavigate('l')
  command! TmuxNavigatePrevious call s:TmuxAwareNavigate('p')
endif
" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
set background=dark
colorscheme gruvbox
" let g:airline_theme='papercolor'
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/src/llvm/tools/clang/tools/clang-format/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp call Formatonsave()

