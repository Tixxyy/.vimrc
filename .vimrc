"sudo apt-get install vim-gtk3
set nocompatible
set nu 
set tabstop=4
set shiftwidth=4
set expandtab
set shiftwidth=4
set smartindent
set hls is
set autoindent 
set nu
set completeopt=longest,menuone

filetype plugin on 

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', {'do':'python3 install.py --clang-completer','for':['cpp','h']}
Plug 'artur-shaik/vim-javacomplete2', {'for':'java'}
call plug#end()

function! OpenCompletion() 
    if !pumvisible() && ((v:char == '.'))
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction

function! JavaSettings()
    setlocal omnifunc=javacomplete#Complete
    nnoremap <F5> :!javac %:t<CR> :!java %:t:r<CR>
    nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
    let g:SuperTabDefaultCompletionType = "<C-x><C-x>"
    autocmd InsertCharPre * call OpenCompletion()
endfunc
autocmd FileType java call JavaSettings()

function! CppSettings()
    nnoremap <F5> :w!<Enter> :!g++ %<CR> :!./a*<CR>
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
endfunc
autocmd FileType cpp call CppSettings()
   
inoremap {<CR> {<CR>}<C-o>O
inoremap <S-Tab> <C-d>

xnoremap <c-y> "+y
nnoremap <c-y> "+p


"ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp /usr/include/c++/7
