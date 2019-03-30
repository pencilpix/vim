" ******************************************************************************
" @author:     pencilpix
" @version:    1.0.0
" ******************************************************************************

" **************************************
" TABLE OF CONTENT
" **************************************
" 1. General Settings.
" 2. Plugins Installations.
" 3. Theme Settings
" 4. Plugins Settings



" GENERAL SETTINGS.
" **************************************
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" fix json double quotes
set conceallevel=0

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
  let mapleader = ","
  let g:mapleader = ","

" Fast saving
  nmap <leader>w :w!<cr>

"Always show current position
  set ruler

" Set 7 lines to the cursor - when moving vertically using j/k
  set so=7

" Turn on the WiLd menu
  set wildmenu

" A buffer becomes hidden when it is abandoned
  set hid

" Configure backspace so it acts as it should act
  set backspace=eol,start,indent
  set whichwrap+=<,>,h,l

" Ignore case when searching
  set ignorecase

" Ignore case when searching
  set ignorecase

" When searching try to be smart about cases 
  set smartcase

" Highlight search results
  set hlsearch

" Makes search act like search in modern browsers
  set incsearch

" Don't redraw while executing macros (good performance config)
  set lazyredraw

" For regular expressions turn magic on
  set magic

" Show matching brackets when text indicator is over them
  set showmatch

" How many tenths of a second to blink when matching brackets
  set mat=2

" No annoying sound on errors
  set noerrorbells
  set novisualbell
  set t_vb=
  set tm=500
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

" tabs and spaces
" Use spaces instead of tabs
  set expandtab

" 1 tab == 2 spaces
  set shiftwidth=2
  set tabstop=2

" smart and auto indent
  set ai
  set si

" wrap lines
  set wrap

" Set utf8 as standard encoding and en_US as the standard language
  set encoding=utf8

" Use Unix as the standard file type
  set ffs=unix,dos,mac

" remove numbers from nerdTree
  let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" 80 ruler
  " let &colorcolumn="80,".join(range(100,999),",")
  let &colorcolumn="60,80,100"

" enabling line number on load
  set number

" Turn backup off, since most stuff is in SVN, git et.c anyway...
  set nobackup
  set nowb
  set noswapfile

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
  vnoremap <silent> * :call VisualSelection('f')<CR>
  vnoremap <silent> # :call VisualSelection('b')<CR>



" whitespace
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" trailing whitespace color
  highlight ExtraWhitespace ctermbg=red guibg=#eeeeee
  set listchars=trail:·
  set list

" set fold option
" note, perl automatically sets foldmethod in the syntax file
  set foldmethod=indent
  set foldnestmax=10
  set nofoldenable
  set foldlevel=2
  " nnoremap <space> za


" enable syntax
  syntax enable
  autocmd Syntax js,ts,css,sass,scss,less,php,html setlocal foldmethod=indent
  autocmd Syntax js,ts,css,sass,scss,less,php,html normal zR

  " autocmd Syntax js,ts,css,sass,scss,less,php,html,vue setlocal foldmethod=indent
  " autocmd Syntax js,ts,css,sass,scss,less,php,html,vue normal zR


" current line highlight
  :hi cursorline   cterm=NONE ctermbg=black guibg=red
  :hi cursorcolumn cterm=NONE ctermbg=black guibg=#eeeeee
  :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" enables highlight to the current window
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

" moving
" Treat long lines as break lines (useful when moving around in them)
  map j gj
  map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
  map <space> /
  map <c-space> ?

" Disable highlight when <leader><cr> is pressed
  map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l

" Close the current buffer
  map <leader>bd :Bclose<cr>

" Close all the buffers
  map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
  map <leader>tn :tabnew<cr>
  map <leader>to :tabonly<cr>
  map <leader>tc :tabclose<cr>
  map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
  map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
  map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
  try
    set switchbuf=useopen,usetab,newtab
    set stal=2
  catch
  endtry

" Return to last edit position when opening files (You want this!)
  autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
  set viminfo^=%

" Always show the status line
  set laststatus=2

" Format the status line
  set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Remap VIM 0 to first non-blank character

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
  nmap <M-j> mz:m+<cr>`z
  nmap <M-k> mz:m-2<cr>`z
  vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

  if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
  endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


" spilit window and navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


" Plugin Installation
" *****************************************************************************

call plug#begin('~/.vim/bundle')
  " 1.NERDTREE
  " add tabs and sidebar
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'Yggdroot/indentLine'

  " 2. status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  " 3. THEME
  Plug 'mhartington/oceanic-next'


  " 4. JS, JSX, VUE and typescript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'leafgarland/typescript-vim'
  Plug 'Quramy/vim-js-pretty-template'

  " Plug 'posva/vim-vue'
  Plug 'othree/yajs.vim'
  Plug 'gavocanov/vim-js-indent'
  "Plug 'othree/es.next.syntax.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Quramy/tsuquyomi'

  " 5. html & css/sass/scss
  Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css', 'scss', 'sass'] }

  Plug 'nvie/vim-flake8'
  Plug 'kien/ctrlp.vim'


  " 6. LINTERS
  Plug 'w0rp/ale'
  Plug 'skywind3000/asyncrun.vim'


  " 7. OTHERS
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'git://github.com/jiangmiao/auto-pairs.git'
  Plug 'scrooloose/nerdcommenter'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'tmhedberg/SimpylFold'

  Plug 'docker/docker'


  " 4. autocomplete
  Plug '1995eaton/vim-better-javascript-completion'
  " Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' }

  " if has('nvim')
  "   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  " endif

" 5. snippets
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/vimproc.vim'
  Plug 'honza/vim-snippets'
  Plug 'joaohkfaria/vim-jest-snippets'
call plug#end()




" *****************************************************************************
" SETTINGS
" *****************************************************************************

  " 1.NERDTREE
  " ***************************************************************************
  map <F2> :NERDTreeTabsToggle<CR>
  " sidebar width
  let g:NERDTreeWinSize = 30
  " open nerdTree in startup
  let g:nerdtree_tabs_open_on_console_startup=1
  let g:nerdtree_tabs_open_on_gui_startup=1


  " 3. THEME
  " *****************************************************************************
  syntax enable
  " for vim 7
  " set t_Co=256

  " for vim 8
  if (has("termguicolors"))
    set termguicolors
  endif

  colorscheme OceanicNext
  highlight ColorColumn guibg=#16242b

  " 5. HTML & CSS/SASS/SCSS
  " *****************************************************************************

  " emmet and support of jsx
  let g:user_emmet_expandabbr_key = "<C-y>"
  let g:use_emmet_complete_tag = 1
  imap <expr> <C-y> emmet#expandAbbrIntelligent("\<C-y>")

  let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}
  autocmd FileType html,css,javascript,jsx EmmetInstall



  " 6. LINTERS
  " *****************************************************************************
  let g:ale_sign_error = '●' " Less aggressive than the default '>>'
  let g:ale_sign_warning = '.'
  let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
  let g:ale_fix_on_save = 1
  autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


  " Use deoplete.
  " ***************************************************************************
  let g:deoplete#enable_at_startup = 1
  let g:echodoc_enable_at_startup=1
  set splitbelow
  set completeopt+=noselect
  set completeopt-=preview
  autocmd CompleteDone * pclose

  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
  let g:deoplete#file#enable_buffer_path=1

  " call deoplete#custom#set('buffer', 'mark', 'ℬ')
  " call deoplete#custom#set('ternjs', 'mark', '')
  " call deoplete#custom#set('omni', 'mark', '⌾')
  " call deoplete#custom#set('file', 'mark', 'file')
  " call deoplete#custom#set('jedi', 'mark', '')
  " call deoplete#custom#set('typescript', 'mark', '')
  " call deoplete#custom#set('neosnippet', 'mark', '')
  " call deoplete#custom#set('typescript',  'rank', 630)
  "
  " let g:deoplete#omni_patterns = {}
  " let g:deoplete#omni_patterns.html = ''
  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
     endif
  endfunction
  autocmd WinEnter * call Preview_func()
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ['around']


  " SNIPETTS
  " ***************************************************************************
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"


  " Easy Align
  " ***************************************************************************
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)



  " indentLine settings
  " ***************************************************************************
  let g:indentLine_char = '⋮'
  let g:indentLine_first_char = '⋮'
  let g:indentLine_showFirstIndentLevel = 0
  let g:indentLine_leadingSpaceChar='·'
  let g:indentLine_leadingSpaceEnabled=0
  let g:indentLine_enabled = 1
  let g:indentLine_color_term = 245



  " NERD COMMENTER
  " ***************************************************************************
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1

  " Add your own custom formats or override the defaults
  " let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1

  " enable nerd commenter in vuejs
  " let g:ft = ''
  " function! NERDCommenter_before()
  "   if &ft == 'vue'
  "     let g:ft = 'vue'
  "     let stack = synstack(line('.'), col('.'))
  "     if len(stack) > 0
  "       let syn = synIDattr((stack)[0], 'name')
  "       if len(syn) > 0
  "         exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
  "       endif
  "     endif
  "   endif
  " endfunction
  " function! NERDCommenter_after()
  "   if g:ft == 'vue'
  "     setf vue
  "     let g:ft = ''
  "   endif
  " endfunction


  " VUE
  " ***************************************************************************
  " let g:vue_disable_pre_processors=1
  " autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.scss
  " autocmd FileType vue syntax sync fromstart



  " JsDoc
  " ***************************************************************************
  nmap <silent> <C-l> <Plug>(jsdoc)
  let g:jsdoc_underscore_private=1
  let g:jsdoc_input_description=1
  let g:jsdoc_allow_input_prompt=1
  let g:jsdoc_enable_es6=1
  " enable for javascript and angular
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_ngdoc = 1


" type script
  let g:typescript_compiler_binary = 'tsc'
  let g:typescript_compiler_options = ''
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow

  " template for angular
  autocmd FileType typescript JsPreTmpl
  autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only. Please see #1 for details.


  " indentation for python
  au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

  " indentation for js/ts, html, css
  au BufNewFile,BufRead *.js, *.jsx, *.ts, *.html, *.css, *.sass, *.scss
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

  " show preview of folded text
  let g:SimpylFold_docstring_preview=1


  " goto definition YouCompleteMe
  " let g:ycm_autoclose_preview_window_after_completion=1
  " map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


  let python_highlight_all=1
  syntax on


  let NERDTreeIgnore=['\.pyc$', '\~$', '\.git$'] "ignore files in NERDTree

