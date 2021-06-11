" removes annoying error sound
set belloff=all
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'


" Install VimPlug from - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"shows files, git-file in the current directory 
"Also support recurssive grep (Note install rg first -> https://github.com/BurntSushi/ripgrep#installation)

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

"themes for vim editor
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'joshdick/onedark.vim'

"commenting 
Plug 'tpope/vim-commentary'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Replace words with copied word
" Copy the words using - "yiw" (yank inner word)
" Go to the the word which you want replaced and type "griw" (go replace inner word)
" Action as usual is repeatable using "."
Plug 'inkarkat/vim-ReplaceWithRegister'
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" For one dark theme
" syntax on
" colorscheme onedark
" set cursorline

" For One half theme
syntax on 
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }

" to get fzf preview syntax highlighting with bat
" First install bat - (https://github.com/sharkdp/bat#installation) - Mac OS  brew install bat
"add this to your ~/.zhrc or ~/.bashrc
" export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
"
"Lets to find files in the directory and subdirectory by using find:<filename>
" set path+=**

" Makes tags recurssively in the directory and can navigate between functions using CTRL + ]
" Go back to the last navigation using CTRL + T
" CTRL + W CTRL = ] opens the definition in a new tab
command! MakeTags !ctags -R .
set tags=./tags;/

set termguicolors
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
set smartcase
set incsearch
set hlsearch
" case insensitive search
set ic
" change to below to not ignore case 
" :set noic
" Press Space to turn off highlighting and clear any message already displayed.
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" https://stackoverflow.com/questions/6488683/how-do-i-change-the-cursor-between-normal-and-insert-modes-in-vim
" change cursor in insert mode 
" Regular mode - block
" Inster mode - line
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" make the switch between insert and normal mode fater 
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

"Shows an exhaustive list during tab completion
set wildmode=longest,list,full

" map the leader key to space bar
let mapleader = " "


"shows all files in the current directory 
noremap <leader>f :Files<CR> 
"shows all git files in the current directory 
noremap <leader>gf :GFiles<CR> 
"shows all files store in buffer 
noremap <leader>b :Buffers<CR> 
" Recurrsive grep
" Must need to install rg 
" Mac - brew install ripgrep 
" Linux - sudo apt-get install ripgrep
noremap <leader>grep :Rg! 

" This seems to mess up code
" Autoformat document                                                                                                                     
" nnoremap F gg=G''

" tv will bring a pane that shows the current directory tree - which is
" verically resized to to 30 units 
let g:netrw_banner = 0
noremap <leader>tv :vsp<bar> :Ex <bar> : vertical resize 30<CR>
"
"
"reduce and increase the side of vertical split
noremap <leader>h :vertical resize +5 <CR>
noremap <leader>l :vertical resize -5 <CR>

" Easy naviation btw vertical splits by CTRL + <h, l, j, k>
" Not so easy after all maybe
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>

" Autocomple paranthesis vim
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" S in normal mode to seach and replace 
noremap S :%s//gI<Left><Left><Left>
