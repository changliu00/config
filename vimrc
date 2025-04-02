"""""""""""""""""""""""""""""""""""""""""""""""""
"" => PLUGIN REGISTRATION IN VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""
" Checkout with: 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim',
" or to '%USERPROFILE%/vimfiles/bundle/Vundle.vim' on Windows,
" then open Vim and run ':PluginInstall'.
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

"" ==> SPECIAL INSTALLATION / FILETYPE SPECIFIC
if !has("win16") && !has("win32")
  Plugin 'ycm-core/YouCompleteMe'
endif
"Plugin 'Valloric/YouCompleteMe' " Old version. See <https://bitbucket.org/Alexander-Shukaev/vim-youcompleteme-for-windows/src/master/> for Windows
" For Windows, requires:
" 1. (G)Vim is installed/compiled with Python support.
"  - Run `:ver(sion)` in Vim to see if 'python', 'python3' (or 'python/dyn',
"    'python3/dyn' for Windows) are included (with the '+' sign).
"  - If NOT (as for the terminal Vim in Windows following official .exe
"    installation), a pre-compiled binary archive can be downloaded from
"    <https://tuxproject.de/projects/vim/> (currently Vim-8.2 with Python-2.7
"    and Python-3.8 support; also check <https://github.com/vim/vim-win32-installer/releases>
"    and the 'more information' link therein). Note to select 32-bit (x86)
"    or 64-bit (x64) to match that of the installed Python dll.
"  - Vim 9.0 currently has problem in rendering concealed characters. Recommend Vim 8.2.
"  - If no auto-install exe file for the desired (python-compiled, 64-bit,
"    etc.) version (only an archive of program files available), then first
"    install using the standard auto-install exe file for the standard version
"    (probably not python-compiled and 32-bit) for system awareness (e.g., you
"    can uninstall Vim through 'Settings', and there is an auto-generated
"    `vim.bat` file in `C:\Windows\` so that you can use Vim from command line
"    (e.g., in PowerShell)), then replace the program files in
"    `C:\Program\ Files\ (x86)\Vim\vim82\` with those of the desired version.
" 2. The right Python dynamic link library (for Windows).
"  - Run `:echo has('python')` and `:python import sys; print(sys.version)`
"    (and for `python3`) to check if this is successful.
"  - If NOT (as is the case where the Python dll's are not registered in the
"    path; so to avoild this, check 'Add python.exe to PATH' when installing it;
"    no need to install for all users (though recommended), nor a path directly
"    to the dll file (auto-added path to e.g. '...\Python38\' suffices)),
"    explicitly set the path to the matching Python dll's:
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
" 3. In case of the error 'CMake Error at CMakeLists.txt:232 (message):
"        Your C++ compiler does NOT fully support C++17.',
"    execute: `
"      sudo apt-get install g++-8
"      sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
"      sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8`
" 4. In case of the error 'CMake Error at /usr/share/cmake-3.22/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
"        Could NOT find Python3: Found unsuitable version "3.10.12", required range
"        is "3.6...3.10" (found /usr/bin/python3, found components: Interpreter [...]',
"    edit file './third_party/ycmd/cpp/CMakeLists.txt' Line 235: `find_package( Python3 3.6...3.10: [...]`:
"                                                      change to `find_package( Python3 3.6...3.10.12: [...]`.

Plugin 'vim-latex/vim-latex' " See <http://vim-latex.sourceforge.net/>
" * For proper math highlights in e.g. align envs in LaTeX:
"   Download <http://www.drchip.org/astronaut/vim/vbafiles/amsmath.vba.gz> to '~/.vim/' or '%USERPROFILE%/vimfiles/',
"   and open it with Vim, and run `:so %`.
" * For forward/inverse searching in LaTeX in Windows:
"   Download SumatraPDF and add it to path.
" * To customize shortcuts in insert mode:
"   Directly edit '$VIMFILES/bundle/vim-latex/ftplugin/latex-suite/main.vim'. E.g., `call IMAP ('==', '={} & ', "tex")`.
Plugin 'changliu00/tex-conceal.vim' " 'KeitaNakamura/tex-conceal.vim'

"" ==> APPEARANCES
Plugin 'flazz/vim-colorschemes'
Plugin 'sainnhe/sonokai'

"Plugin 'Lokaltog/vim-powerline' " 'powerline/powerline' See <https://github.com/Lokaltog/vim-powerline>
Plugin 'itchyny/lightline.vim'

"Plugin 'ShowPairs' " for highlighting the matching pair surrounding the current cursor location. See <http://www.vim.org/scripts/script.php?script_id=626>
"Plugin 'jiangmiao/auto-pairs' " COMMENTED for undesired functionality. For inserting or deleting brackets, parens, quotes in pair. See <https://github.com/vim-scripts/Auto-Pairs>
Plugin 'luochen1990/rainbow' " for visualizing paired brackets
"Plugin 'frazrepo/vim-rainbow' " for visualizing paired brackets; enhanced version but with bug

Plugin 'ap/vim-css-color'
Plugin 'Yggdroot/indentLine' " See <https://github.com/Yggdroot/indentLine>
Plugin 'vim-python/python-syntax'

"" ==> VIEWS AND BEHAVIORS
Plugin 'easymotion/vim-easymotion'

Plugin 'preservim/nerdtree' " Another file system explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlighting Nerdtree
"Plugin 'ryanoasis/vim-devicons' " Icons for Nerdtree

"" ==> EDIT ENHANCEMENTS
Plugin 'changliu00/vim-compare-lines' " Forked from 'statox/vim-compare-lines' Compare Two Lines.
Plugin 'AndrewRadev/linediff.vim' " Compare Two Blocks. Editing also enabled.

"Plugin 'maxbrunsfeld/vim-yankstack' " A simpler alternative to 'yankring'
"Plugin 'YankRing.vim' " for maintaining and visualizing the yank register. See <https://github.com/vim-scripts/YankRing.vim>

Plugin 'tpope/vim-repeat' " Repeat the last command of a plugin.

Plugin 'tpope/vim-surround' " Add (ys), delete (ds) or change (cs) surroundings in pair. See also <https://towardsdatascience.com/how-i-learned-to-enjoy-vim-e310e53e8d56>

"" ==> PROGRAMMING
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'wellle/context.vim'
"if !has("win16") && !has("win32")
"  Plugin 'liuchengxu/vista.vim'
"  " This requires installing ctags:
"  " # install libjansson first to support json formats
"  " sudo apt-get install libjansson-dev
"  " # then compile and install universal-ctags.
"  " # NOTE: Don't use `sudo apt install ctags`, which will install exuberant-ctags and it's not guaranteed to work with vista.vim.
"  " git clone https://github.com/universal-ctags/ctags.git --depth=1
"  " cd ctags
"  " ./autogen.sh
"  " ./configure
"  " make
"  " sudo make install
"endif

Plugin 'preservim/nerdcommenter'

"" ==> RESERVED
"Plugin 'jreybert/vimagit' " Magit-like plugin for vim
" -- Plugin from <http://vim-scripts.org/vim/scripts.html>
"Plugin 'L9' " COMMENTED for conflicting commands (E174)
" -- Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git' " COMMENTED for lack of Ruby support of current Vim. For opening files and buffers with convenience. Calls for Ruby support
" -- Git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

"Plugin 'kien/ctrlp.vim' " for finding and opening files with quick search
"Plugin 'sukima/xmledit' " for conveniently editting XML (and some SGML including HTML)
"Plugin 'sjl/gundo.vim' " for visualizing the vim undo tree
"Plugin 'klen/python-mode' " for easy python code writing. Allowing the use of pylint, rope, pydoc library in vim to provide features like python code looking for bugs, refactoring and some other usefull things.
"Plugin 'Valloric/ListToggle' " COMMENTED for conflicting commands (E174)

"Plugin 'SirVer/ultisnips' " Ultimate solution for snippets in Vim. See <https://github.com/sirver/ultisnips>
"" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"" Trigger configuration. Do not use <tab> if you use <https://github.com/Valloric/YouCompleteMe>.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-b>"
"let g:UltiSnipsJumpBackwardTrigger="<C-z>"
"let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

"Plugin 'EasyGrep' " for Fast and Easy Find and Replace Across Multiple Files. See <http://www.vim.org/scripts/script.php?script_id=2438> and <https://github.com/dkprice/vim-easygrep>
"Plugin 'VOoM' " (Vim Outliner of Markups) a plugin for Vim that emulates a two-pane text outliner. See <http://www.vim.org/scripts/script.php?script_id=2657>
"Plugin 'VimIM' " An independent IM (Input Method) to support CJK search and CJK input. Chinese input! See <http://www.vim.org/scripts/script.php?script_id=2506>
"Plugin 'vim-scripts/taglist.vim' " See <https://www.vim.org/scripts/script.php?script_id=273>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
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

"""""""""""""""""""""""""""""""""""""""""""""""""
"" => PLUGIN CONFIGURATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""

"" ==> SPECIAL INSTALLATION / FILETYPE SPECIFIC
if !has("win16") && !has("win32")
  "" Plugin 'ycm-core/YouCompleteMe'
  "let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' " Specify the configuration file (This is default)
  autocmd FileType * if index(['tex','latex','bib','bibtex'], &filetype) >= 0 | let g:ycm_auto_trigger = 0 | endif " When set to 0, use <C-space> to force semantic completion. Default = 1
  nnoremap <leader>yy :let g:ycm_auto_trigger = !g:ycm_auto_trigger<CR>
  " Do the same as the subcommand 'GoToDefinitionElseDeclaration' (which is only for C#)
  nnoremap gd :YcmCompleter GoTo<CR>
  " Do not recompile the file with libclang (trades correctness for speed)
  nnoremap <leader>yi :YcmCompleter GoToImprecise<CR>
  nnoremap <leader>yr :YcmRestartServer<CR>
  nnoremap <leader>yu :YcmForceCompileAndDiagnostics<CR>
  let g:ycm_min_num_of_chars_for_completion = 4 " Default = 2
  " If =99: turn off the identifier completion engine and just leave the semantic engine.
  nnoremap <leader>ys :let g:ycm_min_num_of_chars_for_completion = 103 - g:ycm_min_num_of_chars_for_completion<CR>
  let g:ycm_max_num_candidates = 30 " Default = 50
  let g:ycm_confirm_extra_conf = 0 " Stop confirming loading extra configuration file when entering vim
  "let g:ycm_collect_identifiers_from_tag_files = 1 " Use the tags file produced by ctags
  "let g:ycm_show_diagnostics_ui = 0 " Stop the built-in checker of ycm for c-related syntax
  " Stop the popup from automatically displaying. Set to 'CursorHold' (default) or 'CursorMoved' (use `K` to toggle between the two) to resume.
  let g:ycm_auto_hover = ''
  nmap gs <Plug>(YCMHover)
  nnoremap gS K
endif

"" Plugin 'vim-latex/vim-latex' " See <http://vim-latex.sourceforge.net/>
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on " already enabled
"
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
" 
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*
" My adjustment: Replace grep with r(ip)g(rep). `-r ./` is by default. Use `-t(T) py` to in(ex)clude filetype
set grepprg=rg\ -nH\ $*
command! -nargs=+ Rg silent! grep <args> | execute 'normal! <C-o>' | tabnew | cfirst | copen
nmap gr :Rg <cword><CR>
" 
" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on " already enabled
" 
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
" Other options
"if &filetype ==? 'tex' || &filetype ==? 'bib' | [commands] | endif " This does not work! When `.vimrc` is loaded, file type is unknown! Try `echom 'a'.&filetype.'b'`, which gives 'ab'.
autocmd FileType tex,latex,bib,bibtex set spell | set nofoldenable | set cole=2 | set cocu=inc

"" ==> APPEARANCES
"" Plugin 'sainnhe/sonokai'
let g:sonokai_style = 'andromeda' " 'default', 'atlantis', 'andromeda', 'shusia', 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

"" Plugin 'Lokaltog/vim-powerline' " 'powerline/powerline' See <https://github.com/Lokaltog/vim-powerline>
"let g:Powerline_symbols = 'unicode' 'fancy'
"" Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

"" Plugin 'luochen1990/rainbow' " for visualizing paired brackets
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"" Plugin 'Yggdroot/indentLine' " See <https://github.com/Yggdroot/indentLine>
" It sets `conceallevel = 2` and `concealcursor = 'inc'`.
let g:indentLine_char = '|'
autocmd FileType tex,latex,bib,bibtex let g:indentLine_enabled=0 " Disable 'indentline' to avoid conceal conflict
autocmd FileType tex,latex,bib,bibtex let g:indentLine_setColors = 0 " Do not overwrite 'conceal' color for tex files
"let g:indentLine_defaultGroup = 'SpecialKey' " Use the same colors as the 'SpecialKey' highlight group
"let g:indentLine_color_term = 239 | let g:indentLine_bgcolor_term = 202 " Customize conceal color
nnoremap <leader>i :IndentLinesToggle<CR>

"" Plugin 'vim-python/python-syntax'
let g:python_highlight_all = 1

"" ==> VIEWS AND BEHAVIORS
"" Plugin 'easymotion/vim-easymotion'
"map <leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Use uppercase target labels and type as a lower case
"let g:EasyMotion_use_upper = 1
" Type `l` and match `l` & `L`
let g:EasyMotion_smartcase = 1
" Type `3` and match `3` & `#`
"let g:EasyMotion_use_smartsign_us = 1
" Jump to anywhere with only `s{char}{target}`. Use `s<CR>` to repeat last find motion.
"map s <Plug>(easymotion-s)
" Jump to anywhere with `s{char}{char}{label}`
nmap s <Plug>(easymotion-s2)
"map <space> <Plug>(easymotion-f)
"map <space><space> <Plug>(easymotion-F)
"map <C-space> <Plug>(easymotion-t)
"map <space> <Plug>(easymotion-s)
"map <space><space> <Plug>(easymotion-bd-t)
map <space> <Plug>(easymotion-bd-fl)
map - <Plug>(easymotion-bd-tl)
"map F <Plug>(easymotion-bd-fl)
"map T <Plug>(easymotion-bd-tl)
"map - <Plug>(easymotion-bd-jk)
map + <Plug>(easymotion-f)
map _ <Plug>(easymotion-F)
"imap <C-s> <Esc>s

"" Plugin 'preservim/nerdtree' " Another file system explorer
nnoremap <leader>f :NERDTreeToggle<CR>
" Open a NERDTree automatically when Vim starts up with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '>' " 'ÎÎ'
"let g:NERDTreeDirArrowCollapsible = 'v' " 'ÎÎ'
"" Plugin 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeShowIgnoredStatus = 1 " To show ignored status (a heavy feature)

"" ==> EDIT ENHANCEMENTS
"" Plugin 'changliu00/vim-compare-lines' " Forked from 'statox/vim-compare-lines' Compare Two Lines.
" Use `:CL` with optional line number(s). Support relative line numbering.

"" Plugin 'AndrewRadev/linediff.vim' " Compare Two Blocks. Editing also enabled.
" `ca`: command alias. Visually select one block and `:CB`, and repeat for another block.
command -range CB <line1>,<line2>Linediff
command CBreset LinediffReset

"" Plugin 'tpope/vim-surround' " Add (ys), delete (ds) or change (cs) surroundings in pair. See also <https://towardsdatascience.com/how-i-learned-to-enjoy-vim-e310e53e8d56>
" `cs"'`: change surrounding '"' with '''.
" `ysiw"`: add '"' surrounding the current word (`iw`).
" `yss)`: add '(',')' pair surrounding the current line (`s`). Use '(' for a space.
" `ys2aw*`: add '*' pair surrounding two words under cursor. `aw`: around words.
" `veeeeS"`: visually select and surround with '"'.
" `dst`, `cst"`: delete/change an html tag.
"nnoremap S ysaw

"" ==> PROGRAMMING
"" Plugin 'tpope/vim-fugitive'
" Examples: " `:G add %` (`:G`=`:Git`) or `:Gw(rite)`; `:Gcommit`; `:Gdiff`;
" `:Gdiffsplit`: diff with the staged;
" `:G blame`: vert-split window for annotations for each line of the file;
" `:Gedit HEAD~3:%`: load the current file as it existed 3 commits ago.
command! -nargs=* Gdf execute 'Gdiff ' . <q-args>
command! -nargs=* Gdfc execute 'Gdiff HEAD ' . <q-args>
command! -nargs=* Gst execute 'G status ' . <q-args>
command! -nargs=* Gbl execute 'G blame ' . <q-args>
command! -nargs=* Gci execute 'G commit ' . <q-args>
command! -nargs=* Gpush execute 'G push ' . <q-args>
command! -nargs=* Glg execute 'G lg ' . <q-args>
command! -nargs=* Glog execute 'G log ' . <q-args>
command! -nargs=* Gbr execute 'G branch ' . <q-args>

"" Plugin 'airblade/vim-gitgutter'
nnoremap <leader>g :GitGutterToggle<CR>
map ]g <Plug>(GitGutterNextHunk)
map [g <Plug>(GitGutterPrevHunk)
set updatetime=1000 " Default = 4000. Also the time delay to write swap files

"" Plugin 'wellle/context.vim'
nnoremap <leader>h :ContextToggleWindow<CR>
"let g:context_filetype_blacklist = []
let g:context_max_height = 11 " 21

"if !has("win16") && !has("win32")
"  "" Plugin 'liuchengxu/vista.vim'
"  nnoremap <leader>v :Vista!!<CR>
"  "let g:vista_icon_indent = ["▸ ", ""] " ["╰─▸ ", "├─▸ "]
"  "let g:vista_fzf_preview = ['right:50%']
"  "let g:vista#renderer#enable_icon = 1
"  "let g:vista#renderer#icons = {
"  "\   "function": "\uf794",
"  "\   "variable": "\uf71b",
"  "\  }
"  " Display function name in status line:
"  function! NearestMethodOrFunction() abort
"    return get(b:, 'vista_nearest_method_or_function', '')
"  endfunction
"  set statusline+=%{NearestMethodOrFunction()}
"  " By default vista.vim never run if you don't call it explicitly.
"  " If you want to show the nearest function in your statusline automatically,
"  " you can add the following line to your vimrc
"  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"endif

"" Plugin 'preservim/nerdcommenter' " for quick commenting
let g:NERDCreateDefaultMappings = 0 " Create default mappings
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 0 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not
" Default Mappings:
" <leader>cc |NERDCommenterComment|, <leader>cn |NERDCommenterNested|,
" <leader>c<space> |NERDCommenterToggle|, <leader>cu |NERDCommenterUncomment|
nnoremap ca :call nerdcommenter#Comment("n", "Comment")<CR>
xnoremap ca :call nerdcommenter#Comment("x", "Comment")<CR>
nnoremap cc :call nerdcommenter#Comment("n", "Toggle")<CR>
xnoremap cc :call nerdcommenter#Comment("x", "Toggle")<CR>
nnoremap cn :call nerdcommenter#Comment("n", "Nested")<CR>
xnoremap cn :call nerdcommenter#Comment("x", "Nested")<CR>
nnoremap cu :call nerdcommenter#Comment("n", "Uncomment")<CR>
xnoremap cu :call nerdcommenter#Comment("x", "Uncomment")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"" => GENERAL CONFIGURATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""

"" ==> SETTINGS FOR WINDOWS
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
	set guifont=Consolas:h14
	set t_ut="" " To properly display background in Windows PowerShell. `t_ut=""` disables Background Color Erase (BCE)
	"set lines=45 columns=158
	set gcr=a:block-blinkon0  " To stop the cursor from shining
	map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" Enable mouse. Commented to allow copying contents to system clipboard
"if has("win16") || has("win32")
"    if has('mouse')
"        set mouse=a
"    endif
"endif

" Sets how many lines of history VIM has to remember
set history=500

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
"let mapleader = ' '  " default is '\'
"let g:mapleader = ' '

"set lazyredraw " Don't redraw while executing macros (good performance config)

"" ==> APPEARANCES
set t_Co=256
set encoding=utf8
set laststatus=2 " Always show the status line
" Characters to fill the statuslines and vertical separators.
set fillchars=vert:\ ,stl:\ ,stlnc:\
set scrolloff=3 " Minimal number of screen lines to keep above and below the cursor. Default 0. `so` for abbr.
"set foldcolumn=1 " Add a bit extra margin to the left
"set cmdheight=1 " Height of the command bar. Default 1
set report=0 " Threshold for reporting number of lines changed. Default 2

" Avoid garbled characters in Chinese language Windows OS
let $LANG='en'    " set message language
set langmenu=en   " set menu's language of gvim. no spaces beside '='
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

set cursorline
"set cursorcolumn

" Set line number
set number relativenumber " nu rnu. Set hybrid line number
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber " rnu
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber " nornu
augroup END

" syntax highlighting
"syntax on  " Highlight colors are overruled but links are kept.
syntax enable  " Only define colors for groups that don't have highlighting yet. Use `:syntax default`
"if has('termguicolors')
"	set termguicolors " Required by 'sainnhe/sonokai', but causes faded cursorline in terminal.
"endif

" Recommended: solarized, molokai, phd, desert, wombat; sonokai
colorscheme molokai
set background=dark
autocmd FileType tex,latex,bib,bibtex highlight! link Conceal Macro " Identifier Operator Special SpecialKey
"highlight Conceal ctermfg=109 ctermbg=NONE guifg=#ff0000 guibg=#00ff00
"highlight Conceal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Toggle conceal
nnoremap <C-q> :set <C-r>=(&cole>1) ? 'cole=0' : 'cole=2'<CR><CR>
imap <C-q> <Esc><C-q>a

"" ==> MOVEMENTS
" Use `autocmd VimEnter *` to conduct the mapping after loading the 'context.vim' plugin
autocmd VimEnter * nnoremap <C-e> <C-e>j
autocmd VimEnter * nnoremap <C-y> <C-y>k

inoremap <C-f> <Esc><C-f>
inoremap <C-b> <Esc><C-b>

" Toggle the cursor to always stay in the middle of screen when scrolling <https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen>.
if !exists('*VCenterCursor')
	augroup VCenterCursor
		au!
		au OptionSet *,*.*
					\ if and( expand("<amatch>")=='scrolloff' ,
					\         exists('#VCenterCursor#WinEnter,WinNew,VimResized') )|
					\   au! VCenterCursor WinEnter,WinNew,VimResized|
					\ endif
	augroup END
	function VCenterCursor()
		if !exists('#VCenterCursor#WinEnter,WinNew,VimResized')
			let s:default_scrolloff=&scrolloff
			let &scrolloff=winheight(win_getid())/2
			au VCenterCursor WinEnter,WinNew,VimResized *,*.*
						\ let &scrolloff=winheight(win_getid())/2
		else
			au! VCenterCursor WinEnter,WinNew,VimResized
			let &scrolloff=s:default_scrolloff
		endif
	endfunction
endif
nnoremap gz :call VCenterCursor()<CR>

"" ==> WINDOWS
" Smart way to move between windows (<C-w><C-j> etc auto. mapped to <C-w>j)
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-w>j " may not be working even with the above option
nnoremap <C-n> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-t> <C-w><C-w>
"inoremap <C-j> <Esc><C-w>j " saved for shortcut jump-out in vim-latex
inoremap <C-k> <Esc><C-w>k
inoremap <C-h> <Esc><C-w>h
inoremap <C-l> <Esc><C-w>l
"inoremap <C-t> <Esc><C-w><C-w>

" Make adjusing split sizes a bit more friendly
nnoremap <silent> <C-w>j :resize -3<CR>
nnoremap <silent> <C-w>k :resize +3<CR>
nnoremap <silent> <C-w>h :vertical resize +3<CR>
nnoremap <silent> <C-w>l :vertical resize -3<CR>

" Change two split windows from vert to horiz or horiz to vert
nnoremap <C-w>v <C-w>t<C-w>H
nnoremap <C-w>s <C-w>t<C-w>K

"" ==> TABS
" Useful mappings for managing tabs
nnoremap <expr> gt v:count ? 'gt' : ':tabnew '

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap ge :tabnew <C-r>=expand("%:p:h")<CR>/

" Easier finger move
"nnoremap ]t gt
"nnoremap [t gT
nnoremap gl gt
nnoremap gh gT
nnoremap gc :tabclose<CR>

" Let `go` toggle between this and the last accessed tab
let g:lasttab = 1
nmap go :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

"inoremap <C-g>l <Esc>gt
"inoremap <C-g>h <Esc>gT
"inoremap <C-g>o <Esc>:exe "tabn ".g:lasttab<CR>

" Duplicate the current file in a new tab with the same cursor location
nnoremap gT :let lnum=line('.') \| let colnum=col('.') \| tabnew \| e # \| call cursor(lnum, colnum)<CR>

nmap gD gTgd

" Open the file with name under the cursor in a new tab
nnoremap gF :exe "tabnew ".expand('<cfile>')<CR>

" Open the file in an existing tab in a split window of the current tab
function! OpenFileFromTabN(cmd, n, close_tab)
  if a:n < 1 || a:n > tabpagenr('$')
    echoerr "Invalid tab number"
    return
  endif
  let bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  execute a:cmd . ' #' . bufnr
  if a:cmd != "diffs"
    let winid = win_getid(tabpagewinnr(a:n), a:n)
    let pos = split(win_execute(winid, 'echo getpos(".")')) " The direct output of `win_e...` is a string
    call cursor(pos[1], pos[2])
  endif
  if a:close_tab
    execute "tabclose " . a:n
  endif
endfunction
command! -nargs=1 Vsplit call OpenFileFromTabN("vsplit", <args>, v:false)
command! -nargs=1 VSPLIT call OpenFileFromTabN("vsplit", <args>, v:true)
command! -nargs=1 Split call OpenFileFromTabN("split", <args>, v:false)
command! -nargs=1 SPLIT call OpenFileFromTabN("split", <args>, v:true)
command! -nargs=1 Diffsplit call OpenFileFromTabN("diffs", <args>, v:false)
command! -nargs=1 DIFFSPLIT call OpenFileFromTabN("diffs", <args>, v:true)
command! -nargs=1 Vsp Vsplit <args>
command! -nargs=1 VSP VSPLIT <args>
command! -nargs=1 Sp Split <args>
command! -nargs=1 SP SPLIT <args>
command! -nargs=1 Diffs Diffsplit <args>
command! -nargs=1 DIFFS DIFFSPLIT <args>

"" ==> VIEWS AND BEHAVIORS
set showmatch " Show matching brackets when text indicator is over them
set matchtime=2 " How many tenths of a second to blink when matching brackets

set wrap " Wrap lines. default on.
nnoremap <leader>w :set wrap!<CR>

noremap <leader>s :setlocal spell!<CR>
"map <leader>sa zg " Add word to dictionary
"map <leader>s? z=

" Display absolute path
nnoremap <C-p> :echo expand('%:p')<CR>

" Switch CWD to the directory of the open buffer
command! CD execute 'cd' expand('%:p:h')

set wildmenu " Turn on the WiLd menu. Command-line completion will operate in an enhanced mode.
set wildignore=*.o,*~,*.pyc " Ignore compiled files
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

"" yank and paste
noremap Y y$
" Toggle paste mode on and off
noremap <leader>p :setlocal paste!<CR>
noremap gp "0p
noremap gP "0P
" Select last paste in visual mode. Use `gv` to select last yanked block.
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

"" folding
"set foldmethod=indent
set foldmethod=syntax
"set nofoldenable " Turn off folding when starting Vim

"" Press <F9> to show the configuration file
if has("win16") || has("win32")
	"nnoremap <F9> :vsp C:/Program\ Files\ (x86)/Vim/_vimrc<CR>:set readonly<CR>
	nnoremap <F9> :vsp $USERPROFILE/_vimrc<CR>:set readonly<CR>
else
	nnoremap <F9> :vsp ~/.vimrc<CR>:set readonly<CR>
endif

"" error/quickfix list
nnoremap <leader>e :copen<CR>
nnoremap ]e :cnext<CR>
nnoremap [e :cprev<CR>
" Use `:cc[number]` to jump to the location of [number]-th spot in the error/quickfix list

"" ==> FILE AND BUFFER
set autoread " Set to auto read when a file is changed from the outside
"set autowrite " Automatically write before moving to another file using tags, make, or <C-o> <C-i>, etc.

"" writes
nmap <C-s> :up<CR>
imap <C-s> <Esc>:up<CR>
" :W sudo saves the file (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null

" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

"" buffer list
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close
set viminfo^=%

" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

"" ==> SEARCH AND REPLACEMENT
set ignorecase
set smartcase
set incsearch
set hlsearch
noremap g/ :set ignorecase!<CR>

noremap K :let @/ = expand('<cword>')<CR>:set hlsearch<CR>
noremap gK :let @/ = '\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>

" Turn off highlighting the last searched item
nnoremap <silent> <leader>q :noh<CR>

" To make `n` always go forward and `N` backward even after `?` and `#` <https://vi.stackexchange.com/questions/2365/how-can-i-get-n-to-go-forward-even-if-i-started-searching-with-or>
noremap <expr> n (v:searchforward ? 'n' : 'N')
noremap <expr> N (v:searchforward ? 'N' : 'n')
noremap <expr> ; (getcharsearch().forward ? ';' : ',')
noremap <expr> , (getcharsearch().forward ? ',' : ';')

" Swap * and g*
noremap * g*
noremap g* *
noremap # g#
noremap g# #

" Show the number of match under cursor
noremap <leader>* *<C-o>:%s///gn<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	"elseif a:direction == 'gv'
	"	call CmdLine("Ag \"" . l:pattern . "\" " )
	"elseif a:direction == 'replace'
	"	call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

set magic " For regular expressions turn magic on
nnoremap S :%s/
"nnoremap s :%s///gc<Left><Left><Left>
"nnoremap s :%s/<C-r><C-w>//gc<Left><Left><Left>

"" ==> EDIT ENHANCEMENTS
"" configure tab
set noexpandtab " Do not use spaces in place of tabs
set tabstop=4  " 1 tab == 4 spaces. default 8
set smarttab
set softtabstop=4
set shiftwidth=4
" Cases to use spaces instead of tabs
autocmd FileType python set tabstop=4|set expandtab|set shiftwidth=4 " In python, space is recommended for indent rather than tab
autocmd FileType tex,latex,bib,bibtex set tabstop=4|set expandtab|set shiftwidth=2 " Indent 2 spaces for tex files

set ai "Auto indent
"set si "Smart indent
set cindent " Works better in most cases but is more strict. Overrides si

" Linebreak on 500 characters
"set lbr
"set tw=500

" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"if has("osx") || has("mac") || has("macunix")
"	nmap <M-j> mz:m+<CR>`z
"	nmap <M-k> mz:m-2<CR>`z
"	vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
"	vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z
"	nmap <D-j> <M-j>
"	nmap <D-k> <M-k>
"	vmap <D-j> <M-j>
"	vmap <D-k> <M-k>
"endif

"" configure diff
set diffopt=vertical " Vertical split is preferred, for e.g., `:diffs`

command! ToggleDiffMode call ToggleDiff()
function! ToggleDiff()
	if &diff
		diffoff!
	else
		windo diffthis
	endif
endfunction
nnoremap <leader>d :ToggleDiffMode<CR>

" Automatically insert the matching part of the pair. Insert mode.
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {<CR>}<ESC>O
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

" Input Greek letters using digraph
inoremap <expr> <C-g> '<C-k>'.nr2char(getchar()).'*' " Greek letter
inoremap <C-g>< <C-k>=<
inoremap <C-g>> <C-k>>=
inoremap <C-g>~ <C-k>?2
inoremap <C-g>! <C-k>!=
inoremap <C-g>+ <C-k>+-
inoremap <C-g>- <C-k>-+
"inoremap <expr> <C-u> '<C-k>'.nr2char(getchar()).'S' " superscript numbers
"inoremap <expr> <C-d> '<C-k>'.nr2char(getchar()).'s' " subscript numbers

"%s/\s\+$//ge " Delete trailing white space
"noremap <leader>m mmHmt:%s/<C-v><CR>//ge<CR>'tzt'm " Remove the Windows ^M - when the encodings gets messed up

"""""""""""""""""""""""""""""""""""""""""""""""""
"" => Notes
"""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Search and replace. <https://vim.fandom.com/wiki/Search_and_replace> <https://learnbyexample.gitbooks.io/vim-reference/content/Regular_Expressions.html>
" * Patterns (`h pattern`):
"   - '(', ')', '{', '}', '?' are normal characters. '[', ']', '*', '.', '^', '$', '&', '\', '/' are not.
"   - `A.*Z`:
"     . `.` matches any character except newline.
"     . `.*` matches zero or more such characters.
"     . `A.*Z` matches GREEDILY: from the first 'A' in a line to the last 'Z' in that line. Matches the whole 'AaZ bb AZ'.
"     . `A.\{-}Z` matches MINIMALLY. In 'AaZ bb AZ', 'AaZ' and 'AZ' are two separate matches.
"       `A.\{5}Z` repeats the match of `.` for 5 times. Same as `A.\{5\}Z`.
"   - `A[a-z,,,\,|]*Z`: `[a-z,,,\,|]` matches a character either in `[a-z]` or ',' or '\' or '|'.
"     `[^a-z,,,\,|]` negates all such characters.
"   - `abc\?d` matches 'abcd' and 'abd'. `a\(bc\)\?d` matches 'abcd' and 'ad'.
"   - For matching a paired bracket with possibly nested brackets inside:
"     - Cannot use regex to match infinitely nested patterns in Vim
"       <https://vi.stackexchange.com/questions/16323/replace-matching-parentheses/16324#16324?newreg=e8f58c1ed9d9452b99d510ce78b8aae9>.
"     - For 'monotone/one-peak' nested patterns like '{a{b{c}d}e}', use `{[^}]*[^{]*}`.
"       But it fails for '{a{b}c{d}}'. For this 'two-peak' pattern, use `{[^}]*[^{]*\({[^}]*[^{]*}\)*}`,
"       which is a recursion of the 'one-peak' pattern. But it fails for the 'one-peak' pattern if followed by further brackets.
"       <https://stackoverflow.com/questions/15301708/perl-regular-expression-match-nested-brackets>
" * Search with easy input <https://vim.fandom.com/wiki/Searching>:
"   - `/<C-r><C-w or -a>` inputs the <cword> or <cWORD> under cursor.
"   - `/<CR>` repeats the last search (also works for `?`, `:s`, `:g`). Useful to alter/confirm the search direction of `n`/`N`.
"   - With `:set incsearch`, when typing the search pattern, press `<C-l>` to insert the next character from the match, or `<C-r><C-w>` to complete the current matching word.
" * Search in range:
"   - v(or V)-select the range, escape, and `/\%Vpattern`.
"   - `/\%>11l\%<15lpattern`: within lines (incl.). `.`: current line; `.+2`=`.2` and `.-2` allowed.
" * Replace flags:
"   - 'g': do as many times as occurs.
"   - 'n': makes `:s` (`:substitute`) command print the number of matches instead of performing an actual substitution.
"   - 'i': ignore case. 'I': case-sensitive.
"   - 'e': don't break command if no search string found.
" * The pair `\(`,`\)`:
"   Groups patterns and stores the matched string, and the string can be recovered by `\1`,`\2`,... according to the order of match.
"   - `:%s/p_{\([a-z,,,\,|]*\)}/p(\1)/gc`: replaces anything like 'p_{s,\zzt,y|x}' by 'p(s,\zzt,y|x)'.
"   - `:%s/p_{\(.\{-}\)}/p(\1)/gc`.
" * `&` in expression: places everything matched in the match-part of the expression.
"   - `:s/\(pattern\)/a\1b/` = `:s/pattern/a&b/`, but is more than that, e.g., `:s/lazy \(dog\|cat\)/& is now stupid \1/`.
"   `&` in normal mode: repeat the last `:s` command.
" * `:g/pattern`, or `:global/pattern/print`, prints all the lines that have 'pattern'.
" * Replace in range <https://vim.fandom.com/wiki/Ranges>:
"   - `:11,15s/old/new/g`: within lines (incl.). `:s/old/new/g`: within current line. `:%s/old/new/g`: all lines.
"   - `:'a,'bs/old/new/g`: within marks 'a' and 'b'. `:'<,'>s/old/new/g`: within visually selected.
"   - `:/apples/,/apples/+1s/old/new/g` = `:/apples/;.1s/old/new/g` (';': current line)
"   - `:g/\\begin{align}/,/\\end{align}/ s/x/y/g`:
"     Look for 'x' between '\begin{align}' and '\end{align}' and substitute all instances of 'x' with 'y'.
"     For all search instances in one line, use `|` to separate the two search expressions.
"     `:g`: global replace in all blocks with the same patterns.
"   - `:g/\\begin{align}/;/\\end{align}/ s/x/y/g`:
"     Same, but '\\end{align}' identifies the first occurrence after '\\begin{align}'.
" * - `:%s/^/# /g`: insert '# ' at the start of each line.
"   - `:s/kingma\zs2013\zeauto/2014/` = `:s/kingma2013auto/kingma2014auto/`.
"   - `:%s//bar/g`: replace each match of the last search pattern with 'bar'.
"   - `:%s/foo/<C-r><C-w>/g`: replace each occurrence of 'foo' with the word (`<C-a>` for WORD) under cursor.
"   - `:%s/foo/\=@r/g`: same as `:%s/foo/<C-r>r/g`, except the text in register 'r' is not printed out as you type.
"   - `:%s/foo/bar/` and `:%s/.*\zsfoo/bar/`: on each line, replace the first and last occurrence of 'foo' with 'bar'.
"   - `:%s/.*\ze\<foo\>//`: on each line, delete all the text preceding the whole word 'foo' (excl.).
" 2. Selection.
" * `vip`: visually select 'inner paragraph'. `viw`: 'inner word'.
" * `gv`: reselect the last visual selection.
" 3. Registers <https://www.brianstorti.com/vim-registers/>.
" * `"ry`, `"rdd`, `"rx`, `"rc`, `"rs`: store in register 'r'. `"rp`: paste from register 'r'.
" * `<C-r>r`: insert text from register 'r' under insert/command mode.
" * `:reg` or `:reg r`: list and view registers.
" * '"': the default register for `c`,`d`,`s`,`x`,`y` and `p`.
" * '+': the clipboard register.
" * '0': always holds the last YANKED text (useful for multiple replace pastes).
"   '1' to '9': hold the newest to oldest DELETED texts as a queue.
" * Read-only registers.
"   - '.': last inserted text.
"   - ':': most recently executed command.
"   - '%': current file path.
"   - '#': name of the alternate file. So `<C-^>` = `:e <C-r>#` = `:e #`.
" * '=': the expression register, stores the result of a command/expression. E.g., `<C-r>=system('ls')<CR>` (insert mode).
" * '/': the search register, stores the searched text.
" * `qw...q`: record commands as a macro stored in register 'w'. Use `@w` to play it.
" * Edit registers:
"   - `:let @w='text'`. Use `:let @w='<C-r>w...'` to edit the original text.
"   - `:let @W='dd'` (capital 'W'): append the string 'dd' to register 'w'.
" 4. Movements.
" * `c`, `y`, `v` with movements:
"   - `ci` inside a pair '', \"\", ``, (), [], {}, <>, <t></t>: change the inner text between.
"   - `ciw`: change the word under cursor. `c3aw`: change the current and the next 2 words. `cap`: change the current paragraph.
"   - `C`: change the rest of line. `cc`: change the whole line (= original `S`).
" * For C code <https://vim.fandom.com/wiki/Jumping_to_the_start_and_end_of_a_code_block>:
"   - `[[`: sections backward or to the previous '{' in the first column.
"   - `[]`: sections backward or to the previous '}' in the first column.
" * For Python code <https://vi.stackexchange.com/questions/7262/end-of-python-block-motion>:
"   - `[[`: Jump backwards to begin of current/previous toplevel.
"   - `[]`: Jump backwards to end of previous toplevel.
"   - `[m`: Jump backwards to begin of current/previous method/scope.
"   - `[M`: Jump backwards to end of previous method/scope.
" * Moving based on folds <https://github.com/lervag/vimtex/issues/1299>:
"   `[z`, `]z`, `zj`, `zk`.
" * Marks <https://vim.fandom.com/wiki/Using_marks>:
"   - `ma`: create mark `a`.
"   - `'a`, ``a`: the line/exact position (line and column) of mark `a`.
"   - ````, `''`: jump back.
"   - ``.`: position where last change occurred in current buffer.
"   - ``"`: position where last exited current buffer.
"   - ``0`, ``1`, ...: position in the (second, third) last file edited.
"   - ``[`, ``]`: beginning/end of the last change or yank or paste.
"   - ``<`, ``>`: beginning/end of last visual selection.
"   - `]'`, `]``: the line/exact position of the next lowercase mark.
" * Tags <https://vim.fandom.com/wiki/Browsing_programs_with_tags>:
"   - Requires a tag file (Exuberant Ctags, easytags).
"   - Jump to tag: `tag: tagname` or press `<C-]>` under 'tagname'. `<C-w>]` opens a new window.
"   - Jump back: `:pop`, or `<C-t>`. The `<C-o>`, `<C-i>` pair also works.
"   - List tag stack: `:tags`.
" 5. Command line history.
" * `:` or `/` then `<Up>` or `<Down>` (support searching with prefix).
"   `:` or `/` then press the 'cedit' key (default: <C-f>) to open the command-line window.
"   `q:` or `q/` to open the command-line window. Press <CR> to execute and double-press <C-c> to cancel and close.
"   `:his` or `:his /` to view command or search history.
" 0. Misc.
" * `@:`: repeat the last Ex command (colon command). `@w`: play macro 'w'. `@@`: further repeat.
"   - Use `@:` with `:%s/\<pig\>/cow/gie|:update|:next`.
" * `:up(date)` updates the file timestamp only when the file has been changed, while `w` always does so.
" * `syntax off`: stop syntax highlight.
" * `:h(elp) something` then press `<C-d>` or `<tab>` (before `<CR>`) to see topics. Use tags to jump.
" * `:set so=999` makes the cursor always in the middle of the screen when scrolling.
" * `vim -q <(grep -nr pattern *.py */*.py)` opens grepped files at the lines in error mode.
" * Use `:command` to list the definition of Ex commands.
"   Use `:verbose command CB` or `:verbose map <C-e>` to check the last user-definition of the command or map.
"   Use `:verbose set number` to check the status of a setting.
"
