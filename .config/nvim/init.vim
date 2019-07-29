call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'morhetz/gruvbox'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()
autocmd BufEnter * call ncm2#enable_for_buffer()
" go to last pos in file
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" autocmd BufWritePre * %s/\s\+$//e
set completeopt=noinsert,menuone,noselect
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set number relativenumber
set magic
set ignorecase
set hidden
set noswapfile
set updatetime=100
set listchars=tab:▸\ ,extends:❯,precedes:❮
set list
let mapleader = " "
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:gruvbox_contrast_dark = 'hard'
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" let g:rustfmt_autosave = 1
let g:gruvbox_italic=1
let g:cpp_class_scope_highlight = 1
let g:LanguageClient_serverCommands = {
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'typescript.tsx': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'haskell': ['hie-wrapper'],
            \ 'ruby': ['~/.rbenv/shims/solargraph'],
            \ 'cpp': ['clangd', '--clang-tidy', '--completion-style=detailed'],
            \ }
" perf improvements
let g:gitgutter_log = 0
let g:airline#extensions#default#section_use_groupitems = 0
let g:airline_extensions = ['languageclient', 'ale', 'branch', 'hunks', 'ctrlspace', 'tabline']
nnoremap <silent> <F1> :Explore <CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <Leader> ff :call LanguageClient_textDocument_codeAction()
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
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<Tab>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" c-j c-k for moving in snippet
let g:UltiSnipsJumpForwardTrigger       = "<tab>"
let g:UltiSnipsJumpBackwardTrigger      = "<c-p>"
let g:UltiSnipsRemoveSelectModeMappings = 0
set background=dark
colorscheme gruvbox
" let g:airline_theme='papercolor'
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/src/llvm/tools/clang/tools/clang-format/clang-format.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp call Formatonsave()
