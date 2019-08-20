"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> Vundle
"    -> Temporary Miscellaneous
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line and command line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Folding
"    -> Misc
"    -> Helper functions
"    -> Settings for Windows
"    -> Vim-latex suite
"    -> Ctags
"    -> Omnicppcomplete
"    -> Taglist
"    -> Winmanager
"    -> YouCompleteMe
"    -> Vim-Powerline
"    -> Syntastic
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Official settings
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
if has("win16") || has("win32")
	"set rtp+=$HOME/.vim/bundle/Vundle.vim/
	"call vundle#begin('$HOME/.vim/bundle/')
	set rtp+=C:/Program\ Files\ (x86)/Vim/vimfiles/bundle/Vundle.vim/
	call vundle#begin('C:/Program Files (x86)/Vim/vimfiles/bundle/')
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	"" Alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')
endif

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" -- Plugin on GitHub repo
Plugin 'tpope/vim-fugitive' " for integrating git
" -- Plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9' " COMMENTED for conflicting commands (E174)
" -- Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git' " COMMENTED for lack of Ruby support of current Vim. For opening files and buffers with convenience. Calls for Ruby support
" -- Git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"if has("win16") || has("win32")
"	Plugin 'rstacruz/sparkup', {'rtp': 'vim'}
"else
"	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " for editing html files
"endif
"" Install L9 and avoid a Naming conflict if you've already installed a different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'} " a Vim-script library, which provides some utility functions and commands for programming in Vim.

"""""""""""""""""""""""""""""""""""""
" Added by me:
" -- Original repos on github
"Plugin 'kien/ctrlp.vim' " for finding and opening files with quick search
"Plugin 'sukima/xmledit' " for conveniently editting XML (and some SGML including HTML)
"Plugin 'sjl/gundo.vim' " for visualizing the vim undo tree
"Plugin 'jiangmiao/auto-pairs' " COMMENTED for not desired functionality. For inserting or deleting brackets, parens, quotes in pair. See https://github.com/vim-scripts/Auto-Pairs
"Plugin 'klen/python-mode' " for easy python code writing. Allowing the use of pylint, rope, pydoc library in vim to provide features like python code looking for bugs, refactoring and some other usefull things.
"Plugin 'Valloric/ListToggle' " COMMENTED for conflicting commands (E174)
"Plugin 'SirVer/ultisnips' " ultimate solution for snippets in Vim. See http://pythonhackers.com/os/SirVer/ultisnips
"Plugin 'Valloric/YouCompleteMe' " superuseful completion plugin " does not support Windows
"Plugin 'scrooloose/syntastic' " for syntax check. Too expensive
"Plugin 't9md/vim-quickhl' " for highlighting. See https://github.com/t9md/vim-quickhl
"Plugin 'scrooloose/nerdcommenter' " for quick commenting
"Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline' " See https://github.com/Lokaltog/vim-powerline
Plugin 'Yggdroot/indentLine' " See https://github.com/Yggdroot/indentLine
"..................................
" -- Vim-scripts repos
"Plugin 'YankRing.vim' " for maintaining and visualizing the yank register. See https://github.com/vim-scripts/YankRing.vim
"Plugin 'vcscommand.vim' " for manipulating files controlled by CVS, SVN, SVK, git, bzr, and hg within VIM, including committing changes and performing diffs using the vimdiff system. See http://www.vim.org/scripts/script.php?script_id=90
Plugin 'ShowPairs' " for highlighting the matching pair surrounding the current cursor location. See http://www.vim.org/scripts/script.php?script_id=626
"Plugin 'SudoEdit.vim' " for editting Files using sudo or su or any other tool. See http://www.vim.org/scripts/script.php?script_id=2709
"Plugin 'EasyGrep' " for Fast and Easy Find and Replace Across Multiple Files. See http://www.vim.org/scripts/script.php?script_id=2438  https://github.com/dkprice/vim-easygrep
"Plugin 'VOoM' " (Vim Outliner of Markups) a plugin for Vim that emulates a two-pane text outliner. See http://www.vim.org/scripts/script.php?script_id=2657
"Plugin 'VimIM' " An independent IM (Input Method) to support CJK search and CJK input. Chinese input! See http://www.vim.org/scripts/script.php?script_id=2506
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/winmanager' " See https://www.vim.org/scripts/script.php?script_id=95
Plugin 'vim-latex/vim-latex' " See http://vim-latex.sourceforge.net/
" End Added by me
"""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" See :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:indentLine_char = '|'
nmap <leader>ii :IndentLinesToggle<CR>


"" Another version
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Bundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" Set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
""" Alternatively, pass a path where Vundle should install plugins
""let path = '~/some/path/here'
""call vundle#rc(path)
"
"" Let Vundle manage Vundle, required
"Plugin 'gmarik/vundle'
"
"" The following are examples of different formats supported.
"" Keep Plugin commands between here and filetype plugin indent on.
"" -- Scripts on GitHub repos
"Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/vim-easymotion' " See https://github.com/Lokaltog/vim-powerline
"Plugin 'tpope/vim-rails.git'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" -- Scripts from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'FuzzyFinder'
"" -- Scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
""" -- Git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
"" ...
"
"filetype plugin indent on     " required
"Bundle 'Valloric/YouCompleteMe'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Temporary Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press F9 to show the configuration file
if has("win16") || has("win32")
	nnoremap <F9> :vsp C:/Program\ Files\ (x86)/Vim/_vimrc<CR>:set readonly<CR>
else
	nnoremap <F9> :vsp $HOME/.vimrc<CR>:set readonly<CR>
endif

" To stop highlighting the word just searched.
"nmap <leader>q :noh<CR>
map <silent> <leader>q :noh<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets no compatible with Vi
"set nocompatible " Already set in Vundle

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
"filetype on
"filetype plugin on
"filetype indent on
"filetype plugin indent on  " the same as the three lines above
" The above line has already been set in Vundle.

" Set to auto read when a file is changed from the outside
set autoread

" Automatically write before moving to another file using tags, make, or <C-O> <C-I>, etc.
"set autowrite

"" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
"let mapleader = ','  " default is '\'
"let g:mapleader = ','

" Fast saving
"nmap <leader>w :w!<cr>
"nmap <leader>w :w<cr>

"" :W sudo saves the file (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Minimal number of screen lines to keep above and below the cursor.
set so=3  " set scrolloff=0. default 0

" Avoid garbled characters in Chinese language Windows OS
let $LANG='en'    " set message language 
set langmenu=en   " set menu's language of gvim. no spaces beside '='
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu. Command-line completion will operate in an enhanced mode.
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler

" Characters to fill the statuslines and vertical separators.
set fillchars=vert:\ ,stl:\ ,stlnc:\

"" A buffer becomes hidden when it is abandoned
"set hid

"" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has("win16") || has("win32")
	if has('mouse')
	  set mouse=a
	endif
endif

"" Ignore case when searching
"set ignorecase
set noic

"" When searching try to be smart about cases 
"set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

"" Don't redraw while executing macros (good performance config)
"set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2  " set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" Add a bit extra margin to the left
"set foldcolumn=1

" Set line number
set nu  " set number

" Highlight current line and column
set cursorline
"set cursorcolumn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
" syntax on  " Highlight colors are overruled but links are kept.
syntax enable  " Only define colors for groups that don't have highlighting yet.  Use \":syntax default\".

try
    " Recommended: solarized, molokai, phd, desert, wombat
    colorscheme molokai
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"" Use Unix as the standard file type
"set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set noexpandtab
autocmd FileType python set expandtab " In python, space is recommended for indent rather than tab
"set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4  " default 8

" Be smart when using tabs ;)
set smarttab

"" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set cindent " Works better in most cases but is more strict. Overrides si
set wrap "Wrap lines. default on.


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

"" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"" Close the current buffer
"map <leader>bd :Bclose<cr>

"" Close all the buffers
"map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew 
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext 

"" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()


"" Opens a new tab with the current buffer's path
"" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

"" Specify the behavior when switching between buffers 
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

"" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
"" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line and command line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"" Height of the command bar
"set cmdheight=1  " default 1

" Threshold for reporting number of lines changed.
set report=0  " default 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The default Y command is the same as yy. Enable behavior like D and C.
map Y y$

"" Automatically insert the matching part of the pair. Insert mode.
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

"" Remap VIM 0 to first non-blank character
"map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
if has("mac") || has("macunix")
	nmap <M-j> mz:m+<cr>`z
	nmap <M-k> mz:m-2<cr>`z
	vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
	vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

"" Delete trailing white space on save, useful for Python and CoffeeScript ;)
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" When you press gv you Ag after the selected text
"vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
"
"" Open Ag and put the cursor in the right position
"map <leader>g :Ag 
"
"" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
"
"" Do :help cope if you are unsure what cope is. It's super useful!
"
"" When you search with Ag, display your results in cope by doing:
""   <leader>cc
"
"" To go to the next search result do:
""   <leader>n
"
"" To go to the previous search results do:
""   <leader>p
"
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"" Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding based on indent or syntax
"set foldmethod=indent
set foldmethod=syntax

"" Turn off folding when starting Vim
"set nofoldenable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

"" Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>

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

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"" Returns true if paste mode is enabled
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    endif
"    return ''
"endfunction

"" Don't close window, when deleting a buffer
"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"     buffer #
"   else
"     bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"     new
"   endif
"
"   if buflisted(l:currentBufNum)
"     execute("bdelete! ".l:currentBufNum)
"   endif
"endfunction


" End of adapted part
""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
" Begin of my adjustments


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings for Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win16") || has("win32")
	" -- Default settings from gVim --
	"" ---- Old version:
	"set nocompatible
	"source $VIMRUNTIME/vimrc_example.vim
	""source $VIMRUNTIME/mswin.vim
	""behave mswin

	"set diffexpr=MyDiff()
	"function MyDiff()
	"  let opt = '-a --binary '
	"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	"  let arg1 = v:fname_in
	"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	"  let arg2 = v:fname_new
	"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	"  let arg3 = v:fname_out
	"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	"  let eq = ''
	"  if $VIMRUNTIME =~ ' '
	"	if &sh =~ '\<cmd'
	"	  let cmd = '"' . $VIMRUNTIME . '\diff"'
	"	  let eq = '""'
	"	else
	"	  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
	"	endif
	"  else
	"	let cmd = $VIMRUNTIME . '\diff'
	"  endif
	"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	"endfunction

	" ---- New version:
	source $VIMRUNTIME/vimrc_example.vim

	set diffexpr=MyDiff()
	function MyDiff()
	  let opt = '-a --binary '
	  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	  let arg1 = v:fname_in
	  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	  let arg1 = substitute(arg1, '!', '\!', 'g')
	  let arg2 = v:fname_new
	  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	  let arg2 = substitute(arg2, '!', '\!', 'g')
	  let arg3 = v:fname_out
	  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	  let arg3 = substitute(arg3, '!', '\!', 'g')
	  if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
		  if empty(&shellxquote)
			let l:shxq_sav = ''
			set shellxquote&
		  endif
		  let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
		  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	  else
		let cmd = $VIMRUNTIME . '\diff'
	  endif
	  let cmd = substitute(cmd, '!', '\!', 'g')
	  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	  if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	  endif
	endfunction

	" -- My settings --
	set guifont=Courier\ New:h12
	"set lines=45 columns=158
	set gcr=a:block-blinkon0  " To stop the cursor from shining
	map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-latex suite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -- Officially recommanded settings --
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on " already enabled

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" man ctags
" Create or update the tags file and update the taglist
nnoremap <leader>ct :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags " Add current directory's generated tags file


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omnicppcomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" :help omnicppcomplete
"" -- Options --
"set completeopt=menu,menuone " With no preview window
"let OmniCpp_MayCompleteDot = 1 " autocomplete with . (default 1)
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with -> (default 1)
"let OmniCpp_MayCompleteScope = 1 " autocomplete with :: (default 1)
"let OmniCpp_SelectFirstItem = 2 " 2: select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
"let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
"let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
"let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
"let OmniCpp_ShowAccess=1
"
"" -- Commands --
"" Automatically complete the code using F3. Note that there should be no character following this mapping command, including <tab>.
"imap <F3> <C-X><C-O>
"" " Completion according to the included files.
""imap <F2> <C-X><C-I>
"
"" To disable and enable the automatic OmniComplete actions
"cmap dsom :let OmniCpp_MayCompleteDot=0<CR>:let OmniCpp_MayCompleteArrow=0<CR>:let OmniCpp_MayCompleteScope=0<CR>
"cmap enom :let OmniCpp_MayCompleteDot=1<CR>:let OmniCpp_MayCompleteArrow=1<CR>:let OmniCpp_MayCompleteScope=1<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help taglist.txt
" -- Options --
let Tlist_Auto_Highlight_Tag=1  " Automatically highlight the current tag in the taglist.
"let Tlist_Auto_Open  " Open the taglist window when Vim starts.
"let Tlist_Auto_Update  " Automatically update the taglist to include newly edited files.
"let Tlist_Close_On_Select  " Close the taglist window when a file or tag is selected.
"let Tlist_Compact_Format  " Remove extra information and blank lines from the taglist window.
let Tlist_Ctags_Cmd='ctags'  " 	Specifies the path to the ctags utility.
let Tlist_Display_Prototype=1  " Show prototypes and not tags in the taglist window.
"let Tlist_Display_Tag_Scope  " Show tag scope next to the tag name.
"let Tlist_Enable_Fold_Column  " Show the fold indicator column in the taglist window.
let Tlist_Exit_OnlyWindow=1  " Close Vim if the taglist is the only window.
let Tlist_File_Fold_Auto_Close=0  " Close tag folds for inactive buffers.
"let Tlist_GainFocus_On_ToggleOpen  " Jump to taglist window on open.
"let Tlist_Highlight_Tag_On_BufEnter  " On entering a buffer, automatically highlight the current tag.
"let Tlist_Inc_Winwidth  " Increase the Vim window width to accommodate the taglist window.
"let Tlist_Max_Submenu_Items  " Maximum number of items in a tags sub-menu.
"let Tlist_Max_Tag_Length  " Maximum tag length used in a tag menu entry.
let Tlist_Process_File_Always=1  " Process files even when the taglist window is closed.
"let Tlist_Show_Menu  " Display the tags menu.
let Tlist_Show_One_File=0  " Show tags for the current buffer only.
"let Tlist_Sort_Type  " Sort method used for arranging the tags.
"let Tlist_Use_Horiz_Window  " Use a horizontally split window for the taglist window.
"let Tlist_Use_Right_Window  " Place the taglist window on the right side.
"let Tlist_Use_SingleClick  " Single click on a tag jumps to it.
"let Tlist_WinHeight  " Horizontally split taglist window height.
"let Tlist_WinWidth  " Vertically split taglist window width.

" -- Commands --
nnoremap <leader>tl :TlistToggle<CR>
nnoremap <leader>ta :TlistAddFiles .
nnoremap <leader>tr :TlistAddFilesRecursive .


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Winmanager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help winmanager
" -- Options --
let g:winManagerWindowLayout='FileExplorer|TagList' " Set the plugins we want to manage.
let g:persistentBehaviour=0 " Exit Vim if winmanager is the last window.

" -- Commands --
nnoremap <leader>wm :WMToggle<CR>
"nnoremap <C-W><C-M> :WMToggle<CR>
"nnoremap <C-W><C-B> :BottomExplorerWindow<CR>
"nnoremap <C-W><C-F> :FirstExplorerWindow<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " Specify the configuration file (This is default)
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>yy :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>YY :let g:ycm_auto_trigger=1<CR>
let g:ycm_confirm_extra_conf=0 " Stop confirming loading extra configuration file when entering vim
let g:ycm_collect_identifiers_from_tag_files = 1 " Use the tags file produced by ctags
let g:ycm_show_diagnostics_ui = 0 " Stops the built-in checker of ycm for c-related syntax


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_ignore_files=[".*"] " stop processing files with matching name (exact reg-ex)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help Powerline
let g:Powerline_symbols = 'unicode' " 'fancy'
set laststatus=2
set t_Co=256
set encoding=utf8


