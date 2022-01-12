execute pathogen#infect()
set nocompatible
let &runtimepath.=',/usr/share/vim/vim81'
let $VIMRUNTIME = "/usr/share/vim/vim81"
syntax on
" Enable syntax highlighting
syntax enable "not working on windows

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => BP
" """""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>




" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'

" Omni Tags
set tags=~/.vim/mytags
" This will look in the current directory for 'tags', and work up the tree towards root until one is found.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>      " A-] - Open the definition in a vertical split


" CTAGS
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Set no swp files
set noswapfile

set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character

" Setting up Directories
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

" Setup UI
set tabpagemax=15               " only show 15 tabs
set showmode                    " display the current mode

" set cursorline                  " highlight current line
" hi cursorline guibg=#32CD32     " highlight bg color of current line
" hi CursorColumn guibg=#32CD32   " highlight cursor

hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=black guibg=blue guifg=orange
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=cyan guibg=darkred guifg=red
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi Search cterm=NONE ctermfg=grey ctermbg=red
hi Visual  ctermbg=darkblue ctermfg=black guibg=blue guifg=orange



if has('cmdline_info')
 set ruler                   " show the ruler
 set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
 set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing

set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set autoindent                  " indent at the same level of the previous line
set tabstop=4                   " an indentation every four columns
set matchpairs+=<:>                " match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufWritePre * :%s/\s\+$//e
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \



" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Stupid shift key fixes
cmap WQ wq
cmap wQ wq
cmap Tabe tabe


" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"clearing highlighted search
nnoremap <F3> :set hlsearch!<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null


hi Pmenu  guifg=#000000 guibg=#2e1c51 ctermfg=black ctermbg=Lightgray
" some convenient mappings and commands
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
"imap <ESC> <nop>
" Press i to enter insert mode, and ii to exit.
imap ii <Esc>
command W w
command Q q

command Gdtempup cd ~/Templates/upmobile/upmobile/upmobile-main/
command Gdcool cd ~/www/cool/what
"command Gd_kit cd ~/www/python_go/client_four/www/star_cor/kit
command Gdkitadmin cd ~/www/kit_web_admin
command Gdnodemodules cd ~/www/node_modules
command Gdcustom cd ~/www/custom
command Gdtemp cd ~/Templates
command Gdsmart cd ~/www/smart_biz/kit_package_diamond_blank
command Gdstar cd ~/www/smart_biz/kit_package_diamond_blank/mobile/kit_droid/www/star_cor/kit
command Gddroid cd ~/www/smart_biz/kit_package_diamond_blank/mobile/kit_droid/
command Gdactive cd ~/www/smart_biz/active
command Gdadmin cd ~/www/smart_biz/kit_package_diamond_blank/web/kit_web_admin
command Gdservice cd ~/www/smart_biz/kit_package_diamond_blank/web/kit_service

command Gfvim cd /home/atl/.vimrc
command Gfbash cd ~/.bashrc

set guioptions-=T
set guioptions+=e
set t_Co=256
set guitablabel=%\ %t

""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""
" change current directory on working folder
set autochdir
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""""""""""""""""
" => Vim user interface
""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
let NERDTreeIgnore = ['\.pyc$']

" Always so current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid


" How many tenths of a second to blink when matching brackets
set mat=1

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search )
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always sho the status line
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Window ^M -when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" NERDTree show hidden
let NERDTreeShowHidden=1

" CTAGS
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
set backupdir=~/.vim/backup/
"set shortmess= "~/.cool"
"No title message
set shortmess+=I


set nonumber

" templates
au BufRead,BufNewFile *.ejs setfiletype html

" ShowMarks {
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Don't leave on by default, use :ShowMarksOn to enable
let g:showmarks_enable = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Formatting {
set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent
set matchpairs+=<:>                " match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufWritePre * :%s/\s\+$//e
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \

" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent

"

