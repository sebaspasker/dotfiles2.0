" First self-based vim configuration
" 
"                            ..,,,,,,,,,.. 
"                      .,;%%%%%%%%%%%%%%%%%%%%;,. 
"                    %%%%%%%%%%%%%%%%%%%%////%%%%%%, .,;%%;, 
"             .,;%/,%%%%%/////%%%%%%%%%%%%%%////%%%%,%%//%%%, 
"        .,;%%%%/,%%%///%%%%%%%%%%%%%%%%%%%%%%%%%%%%,////%%%%;, 
"     .,%%%%%%//,%%%%%%%%%%%%%%%%@@%a%%%%%%%%%%%%%%%%,%%/%%%%%%%;, 
"    .,%//%%%%//,%%%%///////%%%%%%%@@@%%%%%%///////%%%%,%%//%%%%%%%%, 
"  ,%%%%%///%%//,%%//%%%%%///%%%%%@@@%%%%%////%%%%%%%%%,/%%%%%%%%%%%%% 
" .%%%%%%%%%////,%%%%%%%//%///%%%%@@@@%%%////%%/////%%%,/;%%%%%%%%/%%% 
" %/%%%%%%%/////,%%%%///%%////%%%@@@@@%%%///%%/%%%%%//%,////%%%%//%%%' 
" %//%%%%%//////,%/%a`  'a%///%%%@@@@@@%%////a`  'a%%%%,//%///%/%%%%% 
" %///%%%%%%///,%%%%@@aa@@%//%%%@@@@S@@@%%///@@aa@@%%%%%,/%////%%%%% 
" %%//%%%%%%%//,%%%%%///////%%%@S@@@@SS@@@%%/////%%%%%%%,%////%%%%%' 
" %%//%%%%%%%//,%%%%/////%%@%@SS@@@@@@@S@@@@%%%%/////%%%,////%%%%%' 
" `%/%%%%//%%//,%%%///%%%%@@@S@@@@@@@@@@@@@@@S%%%%////%%,///%%%%%' 
"   %%%%//%%%%/,%%%%%%%%@@@@@@@@@@@@@@@@@@@@@SS@%%%%%%%%,//%%%%%' 
"   `%%%//%%%%/,%%%%@%@@@@@@@@@@@@@@@@@@@@@@@@@S@@%%%%%,/////%%' 
"    `%%%//%%%/,%%%@@@SS@@SSs@@@@@@@@@@@@@sSS@@@@@@%%%,//%%//%' 
"     `%%%%%%/  %%S@@SS@@@@@Ss` .,,.    'sS@@@S@@@@%'  ///%/%' 
"       `%%%/    %SS@@@@SSS@@S.         .S@@SSS@@@@'    //%%' 
"                /`S@@@@@@SSSSSs,     ,sSSSSS@@@@@' 
"              %%//`@@@@@@@@@@@@@Ss,sS@@@@@@@@@@@'/ 
"           %%%%@@00`@@@@@@@@@@@@@'@@@@@@@@@@@'//%% 
"         %%%%%%a%@@@@000aaaaaaaaa00a00aaaaaaa00%@%%%%% 
"     %%%%%%a%%@@@@@@@@@@000000000000000000@@@%@@%%%@%%% 
"  %%%%%%a%%@@@%@@@@@@@@@@@00000000000000@@@@@@@@@%@@%%@%% 
" %%%aa%@@@@@@@@@@@@@@0000000000000000000000@@@@@@@@%@@@%%%% 
" %%@@@@@@@@@@@@@@@00000000000000000000000000000@@@@@@@@@%%%%%
"

call plug#begin()

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" List your plugins here
Plug 'tpope/vim-sensible'
"Mete las (, {, etc en pareja
Plug 'jiangmiao/auto-pairs'
" Correcto indent de python
Plug 'vim-scripts/indentpython.vim'
" Supertab
" Plug 'ervandew/supertab'
" Syntastic -> Compila en tiempo real para saber errores
" Plug 'vim-syntastic/syntastic'
" Syntastic check flake8
Plug 'nvie/vim-flake8'
" Completa lo que no esté completo de pairs
Plug 'tpope/vim-surround'
" Repite con . un yank
Plug 'tpope/vim-repeat'
" Comenta con gcc
Plug 'tpope/vim-commentary'
" FZF -> Fuzzer
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }} " fzf
Plug 'junegunn/fzf.vim'
" NerdTree
Plug 'preservim/nerdtree'							
" JS Beautifier
Plug 'maksimr/vim-jsbeautify'
" Higlight yank
Plug 'machakann/vim-highlightedyank'
" Git pero en vim
Plug 'rhysd/git-messenger.vim'
" Vim smoothie scrolling
Plug 'psliwka/vim-smoothie'
" Enhancing in-buffer search experience
Plug 'junegunn/vim-slash'
" Python formatter
Plug 'psf/black'  
" Color preview
Plug 'ap/vim-css-color'
" HTML, CSS, Javascript formatter
Plug 'prettier/vim-prettier'
" Snippets
Plug 'SirVer/ultisnips'  
Plug 'honza/vim-snippets'
" Markdown
" Plug 'vim-pandoc/vim-pandoc'      
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Debugger
Plug 'vim-vdebug/vdebug'
" Nix language support
Plug 'LnL7/vim-nix'

" Enseña modificaciones en git
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'                        " Vim signify diff in file
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy'  }
endif

call plug#end()

syntax enable

"Fly mode in auto-pairs
let g:AutoPairsFlyMode = 0

"Tab configuration
set tabstop=2
set shiftwidth=2

" Evitar modo compatible viejo de vi
set nocompatible
" Make backspace work as you should expect
set backspace=indent,eol,start
" Switch between buffers without having to save first
set hidden
" Show as much as possible of the last line
set display=lastline
" Highlite while searching with / or ?
set incsearch
" Keep matches highlighted
set hlsearch
" Faster redrawing
set ttyfast
" Only redraw when necessary
set cursorline
" Search wrap around end-of-line
set wrapscan
" Always report changed lines
set report=1
" Max highlite the first 200 columns
set synmaxcol=200
"Indent according to previous lìne
set autoindent
" Use inteligent indent for c
set smartindent
" Intelligent comment
set comments=sl:/*,mb:\ *,elx:\ */

"" Make code look pretty
let python_highlight_al=1
syntax on

""Set utf-8 support
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
"SimpylFold configuration
let g:SimpylFold_docstring_preview = 1


" Only a underline in actual position
set cursorline
hi CursorLine gui=underline cterm=underline

filetype on
filetype indent on
filetype plugin on

" Relative in normal mode and absolute in insert mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Syntastic configurations
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Temporary swift syntastic
"let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
" let g:syntastic_html_checkers = ['validator']
" let g:syntastic_python_checkers = ['python', 'flake8']
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_java_checkers = []
" let g:syntastic_go_checkers = ['go', 'gofmt']
" let g:syntastic_nasm_checkers = ['nasm']
" let g:syntastic_sql_checkers = ['sqlint']
" let g:syntastic_javascript_checkers = ['eslint']
" set completeopt=menuone,longest
set completeopt=menu,menuone,noinsert

autocmd BufNewFile,BufRead *.asm set filetype=nasm

" Spell
set nospell
set spelllang=es_es,en_us
autocmd FileType markdown setlocal spell

" Usefull for element/func listing without preliminar references to TabNine
" <c-x><c-o>
" Omnicompletion
autocmd FileType python3 set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set viminfo='10,<100,:100,%,n~/.vim/.viminfo


" FZF
nnoremap <C-h> :call Ffz("Files", "")<left><left>
nnoremap <C-j> :call Ffz("Buffers", "")<left><left>
nnoremap <C-k> :call Ffz("History", "")<left><left>
nnoremap <C-l> :call Ffz("Ag", "")<left><left>

let g:fzf_preview_window = 'right:60%' " Always file previsualization

fun! Ffz(mode, option)
	if a:option == "1"
		let Ffz_var = a:mode . " ."
		execute Ffz_var
	elseif a:option == "2"
		let Ffz_var = a:mode . " .."
		execute Ffz_var
	elseif a:option == "3"
		let Ffz_var = a:mode . " ../.."
		execute Ffz_var
	else 
		let Ffz_var = a:mode . " "  . a:option
		execute Ffz_var
	endif
endfun


" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
" Close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NerdTree when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" When open a saved session don't open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" Open when no vim is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Clipboard
set clipboard+=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+


" Falla con tabnine arreglar
" Git messenger
let g:git_messenger_no_default_mappings = 1
nmap <C-p> <Plug>(git-messenger)


" Vim-slash
noremap <plug>(slash-after) zz

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

"let g:black_linelength = 72
let g:black_linelength = 100


" Prettier Formatting
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0


" Javascript formatter
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Lightline
" set laststatus=2
" set background=dark

" :101y +
let g:loaded_matchparen = 0

" Habilitar autocompletado por tabulación en archivos Markdown
autocmd FileType markdown setlocal omnifunc=markdowncomplete#Complete

" Syntastic va mas fino
set updatetime=300

" Evita que el texto salte cuando aparecen signo de git
set signcolumn=auto

" Espacion en vez de tabs
set expandtab

set wildmenu
set wildmode=longest:full,full

" if has('termguicolors')
"   set termguicolors
" endif

set laststatus=1

if filereadable(expand("~/.vim/colors.vim"))
  source ~/.vim/colors.vim
endif

" ===== CoC =====
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=auto

" Mejor experiencia de completion
set shortmess+=c

" TAB para autocompletar (si quitas supertab)
" let g:AutoPairsMapCR = 0

" Go to definition / references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename
nmap <leader>rn <Plug>(coc-rename)

" Diagnostics nav
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Hover docs
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Formatear
nmap <leader>f  <Plug>(coc-format)
vmap <leader>f  <Plug>(coc-format-selected)

" Code actions (quick fixes)
nmap <leader>a  <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction-selected)

" Highlight símbolo bajo cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" CoC popup
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Confirmar selección CoC con Enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Copilot con Ctrl+Enter
inoremap <silent><script><expr> Ñ copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
