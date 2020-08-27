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
"Plugin 'neoclide/coc.nvim'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://tpope.io/vim/fugitive'
Plugin 'https://github.com/mbbill/undotree'
Plugin 'https://github.com/jremmen/vim-ripgrep'
Plugin 'janko-m/vim-test'
Plugin 'https://github.com/tfnico/vim-gradle'
Plugin 'https://github.com/tpope/vim-dispatch'
Plugin 'https://github.com/jeetsukumaran/vim-buffergator'
Plugin 'https://github.com/Dinduks/vim-java-get-set'
Plugin 'https://github.com/stefandtw/quickfix-reflector.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'stsewd/fzf-checkout.vim'

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
set bg=dark
set guifont=Monaco:h13

let mapleader=" "

nnoremap <silent> <Leader>tt :NERDTreeToggleVCS<CR>
nnoremap <silent> <Leader>tp :NERDTreeFind<CR>
nnoremap <silent> <Leader>rr :NERDTreeRefreshRoot<CR>

nnoremap <silent> <Leader>u :UndotreeToggle<CR>

nnoremap <silent><Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent><Leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent><Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <silent><Leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <silent><Leader>oi :YcmCompleter OrganizeImports<CR>
nnoremap <silent><Leader>ft :YcmCompleter Format<CR>
nnoremap <Leader>yf :YcmCompleter RefactorRename<space>
nnoremap <Leader>yc :YcmForceCompileAndDiagnostics<CR>
nnoremap <Leader>yd :YcmDiags<CR>

let g:ycm_max_diagnostics_to_display = 0
let g:ycm_log_level = 'debug'
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
let g:ycm_auto_hover = -1
let g:ycm_max_diagnostics_to_display = 1000
let g:syntastic_java_checkers = []

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

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 }}
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <Leader>gc :GCheckout<CR>

nnoremap <Leader>rg :Rg<space>
nnoremap <Leader>rc :Rg <C-R><C-W><CR>
let g:rg_command = 'rg --vimgrep -S'
nnoremap <Leader>ff :Files<CR>

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
nnoremap <silent> <Leader>jv :TestVisit<CR>
nnoremap <Leader>jb :call RunAllTests()<CR>
nnoremap <Leader>jq :make testWithoutCoverage<CR>
nnoremap <Leader>jc :!./gradlew clean compileJava<CR>
nnoremap <Leader>je :cb <bar> copen<CR>

nnoremap <Leader>ls :buffers<CR>
nnoremap <Leader>lf :buf<space>
nnoremap <Leader>ld :bd<CR>

nnoremap <Leader>of <C-W>f

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
let g:test_strategy = 'vimterminal'
let test#strategy = g:test_strategy
let test#java#runner = 'gradletest'
let g:base_file_path = ''
let g:test_all = 'false'

function RunAllTests()
    let g:test_all = 'true'
    execute  test#shell('./gradlew clean build integrationTest', g:test_strategy)
endfunction

function RunTestCmd(cmd) abort
    if g:test_all == 'true'
        let g:test_all = 'false'
        return a:cmd
    else
        let pkg_name = PathToPackageName()
        let cmd_ary = split(a:cmd)
        let length = len(cmd_ary)
        let cmd_ary[length -1] = pkg_name . '.' . cmd_ary[length -1]
        return join(cmd_ary, ' ')
    endif
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

autocmd BufRead,BufNewFile,BufEnter */src/test/java/*.java 
    \ let test#java#gradletest#executable = './gradlew testWithoutCoverage' |
    \ let g:base_file_path = 'src/test/java/' 

autocmd BufRead,BufNewFile,BufEnter */src/integration-test/java/*.java 
    \ let test#java#gradletest#executable = './gradlew integrationTestWithoutCoverage' |
    \ let g:base_file_path = 'src/integration-test/java/' 

autocmd BufRead,BufNewFile,BufEnter */src/main/java/*.java 
    \ let g:base_file_path = 'src/main/java/' 

abbr pkg-- package <C-R>=PathToPackageName()<CR>;<CR><CR><Left>
abbr cls-- public class <C-R>=NameOfClass()<CR> {<CR><CR>}<Up>
abbr tst-- @Test<CR>public void test() {<CR><CR>}<Up><Up><End><Left><Left><Left><Left>
abbr ctr-- public <C-R>=NameOfClass()<CR>() {<CR><CR>}<Up>    
abbr ilst-- import java.util.List;
abbr for-- for () {<CR><CR>}<Up><Up><Left><Left><Left>
abbr while-- while () {<CR><CR>}<Up><Up><Left><Left><Left>
abbr mth-- public void () {<CR><CR>}<Up><Up><End><Left><Left><Left><Left>
abbr if-- if () {<CR><CR>}<Up><Up><Left><Left><Left>
abbr sp-- System.out.println("");<Left><Left><Left>
