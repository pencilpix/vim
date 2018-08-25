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
  let &colorcolumn="60,80,100,".join(range(120,999),",")

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


" enable syntax
  syntax enable
  autocmd Syntax js,ts,css,sass,scss,less,php,html,vue setlocal foldmethod=indent
  autocmd Syntax js,ts,css,sass,scss,less,php,html,vue normal zR



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

  " 2. status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


  " 3. THEME
  Plug 'mhartington/oceanic-next'


  " 4. JS and JSX
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  " 5. html & css/sass/scss
  Plug 'mattn/emmet-vim', { 'for': ['javascript', 'jsx', 'html', 'css'] }


  " 6. LINTERS
  Plug 'w0rp/ale'
  Plug 'skywind3000/asyncrun.vim'
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
  autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

