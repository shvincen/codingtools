set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'https://github.com/ycm-core/YouCompleteMe'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://tpope.io/vim/fugitive'
Plugin 'https://github.com/mbbill/undotree'
Plugin 'https://github.com/jremmen/vim-ripgrep'
Plugin 'janko-m/vim-test'
Plugin 'https://github.com/tfnico/vim-gradle'
Plugin 'https://github.com/tpope/vim-dispatch'
"Plugin 'https://github.com/jeetsukumaran/vim-buffergator'
Plugin 'https://github.com/Dinduks/vim-java-get-set'

call vundle#end()            " required
filetype plugin indent on    " required

set noerrorbells
set splitbelow
set splitright
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nocompatible
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nowrap

highlight ColorColumn ctermbg=0
syntax on
autocmd vimenter * colorscheme gruvbox
set bg=light
set guifont=Monaco:h13

let mapleader=" "

nnoremap <silent> <Leader>tt :NERDTreeToggleVCS<CR>
nnoremap <silent> <Leader>tp :NERDTreeFind<CR>

nnoremap <silent> <Leader>u :UndotreeToggle<CR>

nnoremap <silent><Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent><Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent><Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent><Leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <silent><Leader>oi :YcmCompleter OrganizeImports<CR>
nnoremap <silent><Leader>ft :YcmCompleter Format<CR>
nnoremap <Leader>yf :YcmCompleter RefactorRename<space>

nnoremap <Leader>co :Git checkout<space>
nnoremap <Leader>cob :Git checkout -b<space>
nnoremap <Leader>br :Git branch<space>
nnoremap <Leader>pd :Git pull<CR>
nnoremap <Leader>cm :Git commit -am<space>
nnoremap <Leader>ph :Git push<CR>
nnoremap <Leader>bl :Gblame<CR>
nnoremap <Leader>st :Git<CR>
nnoremap <Leader>df :Gdiff<CR>
nnoremap <Leader>mv :GMove %
nnoremap <Leader>rn :GRename %
nnoremap <Leader>dl :GDelete %
nnoremap <Leader>ad :Git add %<CR>

nnoremap <Leader>rg :Rg<space>
nnoremap <Leader>rc :Rg <C-R><C-W><CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <Leader>nt :tabn<CR>
nnoremap <silent> <Leader>pt :tabp<CR>

nnoremap <silent> <Leader>h :resize +15<CR>
nnoremap <silent> <Leader>hs :resize -15<CR>
nnoremap <silent> <Leader>v :vertical resize +15<CR>
nnoremap <silent> <Leader>vs :vertical resize -15<CR>

nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <silent> <Leader>tr :term<CR>source ~/.bash_profile<CR>

nnoremap <silent> <Leader>jt :TestNearest<CR>
nnoremap <silent> <Leader>ja :TestFile<CR>
nnoremap <silent> <Leader>jl :TestLast<CR>
nnoremap <Leader>jb :make clean build integrationTest<CR>
nnoremap <Leader>jq :make testWithoutCoverage<CR>
nnoremap <Leader>jc :make clean test<CR>

nnoremap <Leader>ls :buffers<CR>
nnoremap <Leader>lf :buf<space>
nnoremap <Leader>ld :bd<CR>

:compiler! ./gradlew

if has("persistent_undo")
    set undodir=$HOME."/.vim/undodir"
    set undofile
endif

if executable("rg")
    let g:rg_derive_root='true'
endif

" ctrlp settings
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = 'find %s -type f 
  \ -not -path */bin/* 
  \ -not -path */wrapper/dists/*
  \ -not -path */caches/* 
  \ -not -path */out/*
  \ -not -path */build/*
  \ -not -path */\.git/*
  \ -not -path */\.idea/*
  \ -not -path */native/*'

let g:netrw_banner = 0

" Settings for vim test
let test#strategy = 'vimterminal'
let test#java#runner = 'gradletest'
let g:base_file_path = ''

function RunTestCmd(cmd) abort
    let pkg_name = PathToPackageName()
    let cmd_ary = split(a:cmd)
    let length = len(cmd_ary)
    let cmd_ary[length -1] = pkg_name . '.' . cmd_ary[length -1]
    return join(cmd_ary, ' ')
endfunction

function PathToClassName() 
    if g:base_file_path !=# ''
        let file_path = expand('%:p')
        if stridx(file_path, g:base_file_path) > -1
            let path_start_pos = stridx(file_path, g:base_file_path) + strlen(g:base_file_path)
            let path_end_pos = stridx(file_path, '.') - 1
            let clzz_name = file_path[path_start_pos:path_end_pos] 
            let clzz_name = substitute(clzz_name, '/', '.', 'g')
            return clzz_name
        endif
    endif
    return ''
endfunction

function PathToPackageName()
    if g:base_file_path !=# ''
        let file_path = expand('%:p:h')
        if stridx(file_path, g:base_file_path) > -1
            let path_start_pos = stridx(file_path, g:base_file_path) + strlen(g:base_file_path)
            let pkg_name = file_path[path_start_pos:] 
            let pkg_name = substitute(pkg_name, '/', '.', 'g')
            return pkg_name
        endif
    endif
    return ''
endfunction

function NameOfClass()
    echo g:base_file_path
    if g:base_file_path !=# ''
        let file_name = expand('%:t')
        echo file_name
        let name_end_pos = stridx(file_name, '.') - 1
        return file_name[:name_end_pos] 
    endif
    return ''
endfunction

let g:test#custom_transformations = {'gradle': function('RunTestCmd')}
let g:test#transformation = 'gradle'

autocmd BufRead,BufNewFile */src/test/java/*.java 
    \ let test#java#gradletest#executable = './gradlew -i testWithoutCoverage' |
    \ let g:base_file_path = 'src/test/java/' 

autocmd BufRead,BufNewFile */src/integration-test/java/*.java 
    \ let test#java#gradletest#executable = './gradlew -i integrationTestWithoutCoverage' |
    \ let g:base_file_path = 'src/integration-test/java/' 

autocmd BufRead,BufNewFile */src/main/java/*.java 
    \ let g:base_file_path = 'src/main/java/' 

abbr pkg-- package <C-R>=PathToPackageName()<CR>;<CR><CR><Left>
abbr cls-- public class <C-R>=NameOfClass()<CR> {<CR><CR>}<Up>    
abbr tst-- @Test<CR>public void test() {<CR><CR>}<Up><Up><End><Left><Left><Left><Left>
abbr ctr-- public <C-R>=NameOfClass()<CR>() {<CR><CR>}<Up>    
abbr ilst-- import java.util.List;
abbr for-- for () {<CR><CR>}<Up><Up><Left><Left><Left>
abbr while-- while () {<CR><CR>}<Up><Up><Left><Left><Left>
abbr mth-- public void () {<CR><CR>}<Up><Up><End><Left><Left><Left><Left>

