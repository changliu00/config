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
"    -> Syntastic
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Important: Basic Instructions.
" * Checkout with: 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim',
"   and then open Vim and run ':PluginInstall'.
"   - For Windows, checkout to '%USERPROFILE%/vimfiles/bundle/Vundle.vim'.
" * To install YouCompleteMe, read the instructions there.
" * For vim-latex suite:
"   - For proper math highlights in e.g. align envs in LaTeX:
"     Download <http://www.drchip.org/astronaut/vim/vbafiles/amsmath.vba.gz> to '~/.vim/' or '%USERPROFILE%/vimfiles/',
"     and open it with Vim, and run `:so %`.
"   - For forward/inverse searching in LaTeX in Windows:
"     Download SumatraPDF and add it to path.
"   - To customize shortcuts in insert mode:
"     Directly edit '$VIMFILES/bundle/vim-latex/ftplugin/latex-suite/main.vim'. E.g., `call IMAP ('==', '={} & ', "tex")`.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Official settings
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
if has("win16") || has("win32")
	set rtp+=$USERPROFILE/vimfiles/bundle/Vundle.vim/
	call vundle#begin('$USERPROFILE/vimfiles/bundle/')
	"set rtp+=C:/Program\ Files\ (x86)/Vim/vimfiles/bundle/Vundle.vim/
	"call vundle#begin('C:/Program Files (x86)/Vim/vimfiles/bundle/')
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
Plugin 'tpope/vim-fugitive' " for integrating git. <https://github.com/tpope/vim-fugitive>
" Examples: " `:G add %` (`:G`=`:Git`) or `:Gwrite`; `:Gcommit`; `:Gdiff`;
" `:Gdiffsplit`: diff with the staged;
" `:Gblame`: vert-split window for annotations for each line of the file;
" `:Gedit HEAD~3:%`: load the current file as it existed 3 commits ago.

Plugin 'airblade/vim-gitgutter' " <https://github.com/airblade/vim-gitgutter>
" 'h' for 'hunk' (block of changed lines).
nnoremap <leader>hh :GitGutterToggle<CR>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
set updatetime=1000 " Default = 4000. Also the time delay to write swap files

"Plugin 'jreybert/vimagit' " Magit-like plugin for vim

" -- Plugin from <http://vim-scripts.org/vim/scripts.html>
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
"Plugin 'klen/python-mode' " for easy python code writing. Allowing the use of pylint, rope, pydoc library in vim to provide features like python code looking for bugs, refactoring and some other usefull things.
"Plugin 'Valloric/ListToggle' " COMMENTED for conflicting commands (E174)

" YouCompleteMe <https://github.com/ycm-core/YouCompleteMe>
"Plugin 'Valloric/YouCompleteMe' " Old version. See <https://bitbucket.org/Alexander-Shukaev/vim-youcompleteme-for-windows/src/master/> for Windows
" For Windows, requires:
" 1. (G)Vim is installed/compiled with Python support.
"  - Run `:version` in Vim to see if 'python', 'python3' (or 'python/dyn',
"    'python3/dyn' for Windows) are included (with the '+' sign).
"  - If NOT (as for the terminal Vim in Windows following official .exe
"    installation), a pre-compiled binary archive can be downloaded from
"    <https://tuxproject.de/projects/vim/> (currently Vim-8.2 with Python-2.7
"    and Python-3.8 support; also check <https://github.com/vim/vim-win32-installer/releases>
"    and the 'more information' link therein). Note to select 32-bit (x86)
"    or 64-bit (x64) to match that of the installed Python dll.
" 2. The right Python dynamic link library (for Windows).
"  - Run `:echo has('python')` and `:python import sys; print(sys.version)`
"    (and for `python3`) to check if this is successful.
"  - If NOT (as the case where the Python dll's are not registered in the
"    path), explicitly set the path to the matching Python dll's:
"      `set pythondll=C:\Program\ Files\Python27\python27.dll`
"      `set pythonhome=C:\Program\ Files\Python27`
"      `set pythonthreedll=C:\Program\ Files\Python38\python38.dll`
"      `set pythonthreehome=C:\Program\ Files\Python38`
"  - If no matching Python dll's, install the right version of Python. Check
"    the compilation info in `vim --version` for the Python version
"    (`-DDYNAMIC_PYTHON_DLL`, `-DDYNAMIC_PYTHON3_DLL`) that was used to compile
"    the Vim. Also note to match the right bit (x86 or x64) of Vim and Python.
" 3. If the YCM is desired to be installed with semantic support for C-family
"    languages, install CMake <https://cmake.org/download/> and add to path.
" 4. Make sure that 'Visual Studio Build Tools' are installed (may only for
"    C-family langrage support).
" 5. After `:PluginInstall`, `cd` to '~/vimfiles/bundle/YouCompleteMe' and run
"    `python install.py`. Add option `--clangd-completer` for C-family
"    languages support, and `--cs-completer` for C# support. `--all` available.
" For Ubuntu 16.04 and later:
" 1. Install necessary development tools by running
"    `sudo apt install build-essential cmake python3-dev`.
" 2. Go to the directory `cd ~/.vim/bundle/YouCompleteMe`
"    and run `python3 install.py`. Add option `--clangd-completer` for
"    semantic support for C-family languages. Add option `--all` to compile
"    with everything enabled.
Plugin 'ycm-core/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " Specify the configuration file (This is default)
let g:ycm_auto_trigger = 1 " When set to 0, use <C-Space> to force semantic completion
nnoremap <leader>yy :let g:ycm_auto_trigger = !g:ycm_auto_trigger<CR>
" Do the same as the subcommand 'GoToDefinitionElseDeclaration' (which is only for C#)
nnoremap <leader>yg :YcmCompleter GoTo<CR>
" Do not recompile the file with libclang (trades correctness for speed)
nnoremap <leader>yi :YcmCompleter GoToImprecise<CR>
nnoremap <leader>yr :YcmRestartServer<CR>
nnoremap <leader>yu :YcmForceCompileAndDiagnostics<CR>
" If =99: turn off the identifier completion engine and just leave the semantic engine. If =2: default.
nnoremap <leader>ys :let g:ycm_min_num_of_chars_for_completion = 101 - g:ycm_min_num_of_chars_for_completion<CR>
let g:ycm_max_num_candidates = 30 " Default = 50
let g:ycm_confirm_extra_conf = 0 " Stop confirming loading extra configuration file when entering vim
"let g:ycm_collect_identifiers_from_tag_files = 1 " Use the tags file produced by ctags
"let g:ycm_show_diagnostics_ui = 0 " Stops the built-in checker of ycm for c-related syntax

"Plugin 'vimwiki/vimwiki' " Create a number of linked text files that have their own syntax highlighting
"Plugin 'scrooloose/syntastic' " for syntax check. Too expensive
"Plugin 't9md/vim-quickhl' " for highlighting. See <https://github.com/t9md/vim-quickhl>

"Plugin 'vim-scripts/winmanager' " See <https://www.vim.org/scripts/script.php?script_id=95>
"let g:winManagerWindowLayout='FileExplorer|TagList' " Set the plugins we want to manage.
"let g:winManagerWindowLayout='FileExplorer'
"let g:persistentBehaviour=0 " Exit Vim if winmanager is the last window.
"nnoremap <leader>wm :WMToggle<CR>
""nnoremap <C-W><C-M> :WMToggle<CR>
""nnoremap <C-W><C-B> :BottomExplorerWindow<CR>
""nnoremap <C-W><C-F> :FirstExplorerWindow<CR>

"nnoremap <leader>ee :Explore<CR>
Plugin 'preservim/nerdtree' " Another file system explorer
" Open a NERDTree automatically when Vim starts up with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '>' " 'ÎÎ'
let g:NERDTreeDirArrowCollapsible = 'v' " 'ÎÎ'
nnoremap <leader>ee :NERDTreeToggle<CR>
Plugin 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeShowIgnoredStatus = 1 " To show ignored status (a heavy feature)
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlighting Nerdtree
Plugin 'ryanoasis/vim-devicons' " Icons for Nerdtree

Plugin 'preservim/nerdcommenter' " for quick commenting
let g:NERDSpaceDelims = 0 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not 
" Default Mappings:
" <leader>cc |NERDCommenterComment|, <leader>cn |NERDCommenterNested|,
" <leader>c<space> |NERDCommenterToggle|, <leader>cu |NERDCommenterUncomment|

Plugin 'vim-python/python-syntax' " Python highlighting
let g:python_highlight_all = 1
Plugin 'ap/vim-css-color'

"Plugin 'SirVer/ultisnips' " Ultimate solution for snippets in Vim. See <https://github.com/sirver/ultisnips>
"" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"" Trigger configuration. Do not use <tab> if you use <https://github.com/Valloric/YouCompleteMe>.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

"Plugin 'vifm/vifm.vim' " Curser-based vi[m]-like file manager. Download first from <https://vifm.info/downloads.shtml>
"map <leader>vv :Vifm<CR>
""vp :VsplitVifm<CR> vs :SplitVifm<CR> vd :DiffVifm<CR> vt :TabVifm<CR>

"Plugin 'itchyny/lightline.vim'
Plugin 'Lokaltog/vim-powerline' " See <https://github.com/Lokaltog/vim-powerline>
let g:Powerline_symbols = 'unicode' " 'fancy'
set laststatus=2
set t_Co=256
set encoding=utf8

Plugin 'Yggdroot/indentLine' " See <https://github.com/Yggdroot/indentLine>
let g:indentLine_char = '|'
nmap <leader>ii :IndentLinesToggle<CR>

"..................................
" -- Vim-scripts repos
"Plugin 'YankRing.vim' " for maintaining and visualizing the yank register. See <https://github.com/vim-scripts/YankRing.vim>
"Plugin 'vcscommand.vim' " for manipulating files controlled by CVS, SVN, SVK, git, bzr, and hg within VIM, including committing changes and performing diffs using the vimdiff system. See <http://www.vim.org/scripts/script.php?script_id=90>
"Plugin 'SudoEdit.vim' " for editting Files using sudo or su or any other tool. See <http://www.vim.org/scripts/script.php?script_id=2709>
"Plugin 'EasyGrep' " for Fast and Easy Find and Replace Across Multiple Files. See <http://www.vim.org/scripts/script.php?script_id=2438> and <https://github.com/dkprice/vim-easygrep>
"Plugin 'VOoM' " (Vim Outliner of Markups) a plugin for Vim that emulates a two-pane text outliner. See <http://www.vim.org/scripts/script.php?script_id=2657>
"Plugin 'VimIM' " An independent IM (Input Method) to support CJK search and CJK input. Chinese input! See <http://www.vim.org/scripts/script.php?script_id=2506>
"Plugin 'vim-scripts/taglist.vim' " See <https://www.vim.org/scripts/script.php?script_id=273>
Plugin 'vim-latex/vim-latex' " See <http://vim-latex.sourceforge.net/>

Plugin 'flazz/vim-colorschemes'
Plugin 'sainnhe/sonokai'
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

"Plugin 'ShowPairs' " for highlighting the matching pair surrounding the current cursor location. See <http://www.vim.org/scripts/script.php?script_id=626>
"Plugin 'jiangmiao/auto-pairs' " COMMENTED for undesired functionality. For inserting or deleting brackets, parens, quotes in pair. See <https://github.com/vim-scripts/Auto-Pairs>
"Plugin 'luochen1990/rainbow' " for visualizing paired brackets
Plugin 'frazrepo/vim-rainbow' " for visualizing paired brackets; enhanced version
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

Plugin 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
" To install the mini-server, run
" `[sudo] npm -g install instant-markdown-d` or `pip install --user smdv`.
" Require: [Linux] xdg-utils, curl, nodejs; [Windows] cURL (and in %PATH%).
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "chrome --new-window"    " The browser for preview
let g:instant_markdown_slow = 1              " Stop updating the display in real-time
let g:instant_markdown_mathjax = 1
map <leader>md :InstantMarkdownPreview<CR>
map <leader>ms :InstantMarkdownStop<CR>

Plugin 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
" Jump to anywhere with only `s{char}{target}`. Use `s<CR>` to repeat last find motion.
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-s2)
vmap S <Plug>(easymotion-s2)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" Type `l` and match `l` & `L`
let g:EasyMotion_smartcase = 1
" Type `3` and match `3` & `#`
let g:EasyMotion_use_smartsign_us = 1

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Temporary Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press F9 to show the configuration file
if has("win16") || has("win32")
	"nnoremap <F9> :vsp C:/Program\ Files\ (x86)/Vim/_vimrc<CR>:set readonly<CR>
	nnoremap <F9> :vsp $USERPROFILE/_vimrc<CR>:set readonly<CR>
else
	nnoremap <F9> :vsp ~/.vimrc<CR>:set readonly<CR>
endif

" For diff
set diffopt=vertical " Vertical split is preferred, for e.g., `:diffs`

" Select last paste in visual mode. Use `gv` to select last yanked block.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'


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

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nnoremap <space> /
"nnoremap <c-space> ?

"" Disable highlighting the last searched item
nnoremap <silent> <leader>q :noh<CR>

" Show the number of match under cursor
nnoremap <leader>* *<C-O>:%s///gn<CR>

"" Ignore case when searching
"set ic

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
set number relativenumber " nu rnu. Set hybrid line number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber " rnu
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber " nornu
augroup END

" Highlight current line and column
set cursorline
"set cursorcolumn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
" syntax on  " Highlight colors are overruled but links are kept.
syntax enable  " Only define colors for groups that don't have highlighting yet. Use `:syntax default`
"set termguicolors " Required by 'sainnhe/sonokai', but causes faded cursorline in terminal.

" Recommended: solarized, molokai, phd, desert, wombat; sonokai
colorscheme molokai
set background=dark

"" Set extra options when running in GUI mode
"if has("gui_running")
"    set guioptions-=T
"    set guioptions-=e
"    set t_Co=256
"    set guitablabel=%M\ %t
"endif

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
" Do not use spaces in place of tabs
set noexpandtab
" 1 tab == 4 spaces
set tabstop=4  " default 8
set softtabstop=4
set shiftwidth=4
" Cases to use spaces instead of tabs
autocmd FileType python set tabstop=4|set expandtab|set shiftwidth=4 " In python, space is recommended for indent rather than tab
autocmd FileType tex set tabstop=4|set expandtab|set shiftwidth=2 " Indent 2 spaces for tex files

" Be smart when using tabs ;)
set smarttab

"" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set cindent " Works better in most cases but is more strict. Overrides si
set wrap "Wrap lines. default on.
nnoremap <leader>ww :set wrap!<CR>


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

"" Smart way to move between windows (<C-w><C-j> etc auto. mapped to <C-w>j)
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-W><Left> :vertical resize +3<CR>
noremap <silent> <C-W><Right> :vertical resize -3<CR>
noremap <silent> <C-W><Up> :resize +3<CR>
noremap <silent> <C-W><Down> :resize -3<CR>

" Change two split windows from vert to horiz or horiz to vert
nmap <C-w>V <C-w>t<C-w>H
nmap <C-w>S <C-w>t<C-w>K

" Open terminal inside Vim
nmap <C-w>T :vnew term://bash<CR>

"" Close the current buffer
"map <leader>bd :Bclose<cr>

"" Close all the buffers
"map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
nmap <leader>tn :tabnew 
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext 

"" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
"autocmd TabLeave * let g:lasttab = tabpagenr()


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
if has("osx") || has("mac") || has("macunix")
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
"map <leader>sa zg " Add word to dictionary
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
	"set guifont=Courier\ New:h12
	set guifont=Consolas:h13
	set t_Co=256 t_ut="" " To properly display background in Windows PowerShell. `t_ut=""` disables Background Color Erase (BCE)
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

" My adjustments
set noshellslash " For enabling forward search with SumatraPDF in Windows. Alternatively, substitute `target_file` with `'%:r.pdf'` and `sourcefileFull` with `'%:p'` in Line 385 of 'vim-latex/ftplugin/latex-suite/compiler.vim' (The line is originally `let execString .= Tex_Stringformat('start %s %s -forward-search %s %s', viewer, target_file, sourcefileFull, linenr)`.)
let g:Tex_DefaultTargetFormat = 'pdf' " Default = dvi
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -file-line-error-style -src-specials $*' " Default = 'latex -interaction=nonstopmode -file-line-error-style $*'. Add '-src-specials' to enable forward/inverse searching
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*' " Default = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'. The option '-synctex=1' enables forward/inverse searching by providing a synctex(.gz) file to the pdf viewer
let g:Tex_MultipleCompileFormats = 'dvi,pdf' " Default = 'dvi'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf' " Default = 'dvi,pdf'
let g:Tex_ViewRule_pdf = '' " Default = 'xpdf' for Unix. Consider 'Zathura' for Ubuntu
if has("win16") || has("win32")
	let g:Tex_ViewRule_pdf = 'SumatraPDF -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""' " Default = 'AcroRd32' for Windows
elseif has("osx") || has("mac") || has("macunix")
	let g:Tex_TreatMacViewerAsUNIX = 1 " To enable forward/inverse searching on Macintosh systems
endif
let g:tex_indent_brace = 1 " Default = 1
let g:tex_indent_items = 1 " Default = 1
let g:tex_items = '\\bibitem\|\\item' " Default = '\\bibitem\|\\item'
let g:tex_itemize_env = 'itemize\|description\|enumerate\|thebibliography' " Default = 'itemize\|description\|enumerate\|thebibliography'
let g:tex_noindent_env = 'document\|verbatim\|comment\|lstlisting' " Default = 'document\|verbatim\|comment\|lstlisting'
let g:tex_indent_ifelsefi = 0 " Default = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" man ctags
"" Create or update the tags file and update the taglist
"nnoremap <leader>ct :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"set tags=tags
"set tags+=./tags " Add current directory's generated tags file


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
"" :help taglist.txt
"" -- Options --
"let Tlist_Auto_Highlight_Tag=1  " Automatically highlight the current tag in the taglist.
""let Tlist_Auto_Open  " Open the taglist window when Vim starts.
""let Tlist_Auto_Update  " Automatically update the taglist to include newly edited files.
""let Tlist_Close_On_Select  " Close the taglist window when a file or tag is selected.
""let Tlist_Compact_Format  " Remove extra information and blank lines from the taglist window.
"let Tlist_Ctags_Cmd='ctags'  " 	Specifies the path to the ctags utility.
"let Tlist_Display_Prototype=1  " Show prototypes and not tags in the taglist window.
""let Tlist_Display_Tag_Scope  " Show tag scope next to the tag name.
""let Tlist_Enable_Fold_Column  " Show the fold indicator column in the taglist window.
"let Tlist_Exit_OnlyWindow=1  " Close Vim if the taglist is the only window.
"let Tlist_File_Fold_Auto_Close=0  " Close tag folds for inactive buffers.
""let Tlist_GainFocus_On_ToggleOpen  " Jump to taglist window on open.
""let Tlist_Highlight_Tag_On_BufEnter  " On entering a buffer, automatically highlight the current tag.
""let Tlist_Inc_Winwidth  " Increase the Vim window width to accommodate the taglist window.
""let Tlist_Max_Submenu_Items  " Maximum number of items in a tags sub-menu.
""let Tlist_Max_Tag_Length  " Maximum tag length used in a tag menu entry.
"let Tlist_Process_File_Always=1  " Process files even when the taglist window is closed.
""let Tlist_Show_Menu  " Display the tags menu.
"let Tlist_Show_One_File=0  " Show tags for the current buffer only.
""let Tlist_Sort_Type  " Sort method used for arranging the tags.
""let Tlist_Use_Horiz_Window  " Use a horizontally split window for the taglist window.
""let Tlist_Use_Right_Window  " Place the taglist window on the right side.
""let Tlist_Use_SingleClick  " Single click on a tag jumps to it.
""let Tlist_WinHeight  " Horizontally split taglist window height.
""let Tlist_WinWidth  " Vertically split taglist window width.
"
"" -- Commands --
"nnoremap <leader>tl :TlistToggle<CR>
"nnoremap <leader>ta :TlistAddFiles .
"nnoremap <leader>tr :TlistAddFilesRecursive .


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
" => Notes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Search and replace. <https://vim.fandom.com/wiki/Search_and_replace>
" * `:%s/p_{\([a-z,,,\,|]*\)}/p(\1)/gc`:
"   Replaces anything like 'p_{s,\zzt,y|x}' with 'p(s,\zzt,y|x)'.
"   - '{', '}' are normal characters. `[`, `*`, `.` are not.
"   - `[a-z,,,\,|]`: matches a character that is either in `[a-z]` or is ',' or '\' or '|'.
"   - `[a-z,,,\,|]*`: matches zero or more such characters.
"   - The pair `\(`, `\)`: stores the matched string, and the string can be recovered by `\1`, `\2`, etc. according to the order of match.
" * `:%s/p_{\(.*\)}/p(\1)/gc`:
"   - `.`: matches any character except newline.
"   - `{.*}`: matches greedily (from the first '{' in a line to the last '}' in a line): '{aaa} bbb {ccc}'.
" * `:s/p_{\(.\{-}\)}/p(\1)/gc`:
"   - `{.\{-}}`: matches minimally: in '{aaa} bbb {ccc}', '{aaa}' and '{ccc}' are two separate matches.
" * The `n` flag makes the `:s` (`:substitute`) command print the number of matches instead of performing an actual substitution.
" * `:global/pattern/print`, or just `:g/pattern`, prints all the lines that match 'pattern'.
" * `&`: everything that was matched in the match-part of the expression.
"   - `:s/\(pattern\)/a\1b/` = `:s/pattern/a&b/`, but is more than that: consider `:s/lazy \(dog\|cat\)/& is now stupid \1/`.
" * `&` in normal mode: repeat the last `:s` command.
" * `:s/kingma2013auto/kingma2014auto/` = `:s/kingma\zs2013\zeauto/2014/`.
" * `:g/\\begin{align}/,/\\end{align}/s/x/y/g`:
"   Look for 'x' between '\begin{align}' and '\end{align}' and substitute all instances of 'x' with 'y'.
"   For all search instances in one line, use `|` to separate the two search expressions.
"
