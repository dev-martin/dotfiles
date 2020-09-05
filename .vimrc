set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" File Explorer
Plug 'scrooloose/nerdtree'

" Autocompletition
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder
Plug 'kien/ctrlp.vim'

" Git Integration
Plug 'lambdalisue/gina.vim'

" Language checker
Plug 'vim-syntastic/syntastic'

" Commenting chunks of code with ,cc
Plug 'preservim/nerdcommenter'

" To surround expressions
Plug 'tpope/vim-surround'

" Start menu 
Plug 'mhinz/vim-startify'

" Terminal for vim?
Plug 'gu-fan/simpleterm.vim'

" Color Theme
Plug 'morhetz/gruvbox'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline' " Show buffers on statusline

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required


set ttyfast			" Scroll faster

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set encoding=utf-8              " Set default encoding to UTF-8
set autoindent
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches

set ruler                    " Show cursor position
set showcmd                  " Show me what I'm typing

set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows

set autowrite                " Automatically save before :next, :make etc.
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set pumheight=10             " Completion window max size
set colorcolumn=72

set number 		    " Set line numbers
set relativenumber
set tabstop=3
set shiftwidth=3
set expandtab
set laststatus=2
set tws="20*0"      " Set correct terminal size so its not too big


" color
syntax on
set t_Co=256
colorscheme gruvbox
set bg=dark


let mapleader = ',' " Remapped leader key to ','
inoremap `  <Esc>   " Remapped Esc key yo '`'
nnoremap <Leader>t :Sshow<CR> " Remmap terminal to ,t

" Remap tab keys to switch between tabs w/,. or ,m
nnoremap <leader>. :tabnext<CR>
nnoremap <leader>m :tabprev<CR>

" Remap o and O so they dont go into insert mode automatically
nnoremap o o<Esc>
nnoremap O O<Esc>

" Autocomplete when you put a (,{ or [ 
inoremap {<cr> {<cr>}
inoremap [<cr> [<cr>]
inoremap (<cr> (<cr>)

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Auto scp into ENEE150 after write/save in VIM
autocmd BufWritePost *ENEE150/Homework/* !/Users/martin/uni/ENEE150/scripts/hw.sh %:p 
autocmd BufWritePost *ENEE150/quizzes/* !/Users/martin/uni/ENEE150/scripts/quizz.sh %:p 
autocmd BufWritePost *ENEE150/projects/* !/Users/martin/uni/ENEE150/scripts/project.sh %:p 

" Auto copy files to buffovflow container whenever I save 
autocmd BufWritePost */CMSC414/projects/buffer-overflow/* !/Users/martin/uni/CMSC414/projects/buffer-overflow/build.sh


" Plugins Confiurations

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#format = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#gina#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#nerdtree_status = 1
let g:airline#extensions#wordcount#enabled = 0

" NERDTree config
noremap <Leader>n :NERDTreeToggle %<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 2
	" Make NERDTree die when vim dies
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP config
let g:ctrlp_cache_dir = $HOME.'/.tmp/ctrlp'
let g:ctrlp_working_path_mode = 'c'
map <C-p> :CtrlP c<cr>

" Synstastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1

	"Turn off Nullable annoyin errors in C programs
let g:syntastic_quiet_messages = { "regex": ['Nullable','_Nonnull'] }

" CoC Confiuration Start

	"" TextEdit might fail if hidden is not set.
	"set hidden

	"" Some servers have issues with backup files, see #649.
	"set nobackup
	"set nowritebackup

	"" Give more space for displaying messages.
	"set cmdheight=2

	"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
	"" delays and poor user experience.
	"set updatetime=300

	"" Don't pass messages to |ins-completion-menu|.
	"set shortmess+=c

	"" Always show the signcolumn, otherwise it would shift the text each time
	"" diagnostics appear/become resolved.
	"if has("patch-8.1.1564")
	  "" Recently vim can merge signcolumn and number column into one
	  "set signcolumn=number
	"else
	  "set signcolumn=yes
	"endif

	"" Use tab for trigger completion with characters ahead and navigate.
	"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	"" other plugin before putting this into your config.
	"inoremap <silent><expr> <TAB>
		  "\ pumvisible() ? "\<C-n>" :
		  "\ <SID>check_back_space() ? "\<TAB>" :
		  "\ coc#refresh()
	"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	"function! s:check_back_space() abort
	  "let col = col('.') - 1
	  "return !col || getline('.')[col - 1]  =~# '\s'
	"endfunction

	"" Use <c-space> to trigger completion.
	"inoremap <silent><expr> <c-space> coc#refresh()

	"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	"" position. Coc only does snippet and additional edit on confirm.
	"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
	"if exists('*complete_info')
	  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	"else
	  "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	"endif

	"" Use `[g` and `]g` to navigate diagnostics
	"nmap <silent> [g <Plug>(coc-diagnostic-prev)
	"nmap <silent> ]g <Plug>(coc-diagnostic-next)

	"" GoTo code navigation.
	"nmap <silent> gd <Plug>(coc-definition)
	"nmap <silent> gy <Plug>(coc-type-definition)
	"nmap <silent> gi <Plug>(coc-implementation)
	"nmap <silent> gr <Plug>(coc-references)

	"" Use K to show documentation in preview window.
	"nnoremap <silent> K :call <SID>show_documentation()<CR>

	"function! s:show_documentation()
	  "if (index(['vim','help'], &filetype) >= 0)
		"execute 'h '.expand('<cword>')
	  "else
		"call CocAction('doHover')
	  "endif
	"endfunction

	"" Highlight the symbol and its references when holding the cursor.
	"autocmd CursorHold * silent call CocActionAsync('highlight')

	"" Symbol renaming.
	"nmap <leader>rn <Plug>(coc-rename)

	"" Formatting selected code.
	"xmap <leader>f  <Plug>(coc-format-selected)
	"nmap <leader>f  <Plug>(coc-format-selected)

	"augroup mygroup
	  "autocmd!
	  "" Setup formatexpr specified filetype(s).
	  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  "" Update signature help on jump placeholder.
	  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	"augroup end

	"" Applying codeAction to the selected region.
	"" Example: `<leader>aap` for current paragraph
	"xmap <leader>a  <Plug>(coc-codeaction-selected)
	"nmap <leader>a  <Plug>(coc-codeaction-selected)

	"" Remap keys for applying codeAction to the current buffer.
	"nmap <leader>ac  <Plug>(coc-codeaction)
	"" Apply AutoFix to problem on the current line.
	"nmap <leader>qf  <Plug>(coc-fix-current)

	"" Map function and class text objects
	"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
	"xmap if <Plug>(coc-funcobj-i)
	"omap if <Plug>(coc-funcobj-i)
	"xmap af <Plug>(coc-funcobj-a)
	"omap af <Plug>(coc-funcobj-a)
	"xmap ic <Plug>(coc-classobj-i)
	"omap ic <Plug>(coc-classobj-i)
	"xmap ac <Plug>(coc-classobj-a)
	"omap ac <Plug>(coc-classobj-a)

	"" Use CTRL-S for selections ranges.
	"" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
	"nmap <silent> <C-s> <Plug>(coc-range-select)
	"xmap <silent> <C-s> <Plug>(coc-range-select)

	"" Add `:Format` command to format current buffer.
	"command! -nargs=0 Format :call CocAction('format')

	"" Add `:Fold` command to fold current buffer.
	"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	"" Add `:OR` command for organize imports of the current buffer.
	"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	"" Add (Neo)Vim's native statusline support.
	"" NOTE: Please see `:h coc-status` for integrations with external plugins that
	"" provide custom statusline: lightline.vim, vim-airline.
	"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	"" Mappings using CoCList:
	"" Show all diagnostics.
	"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	"" Manage extensions.
	"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	"" Show commands.
	"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	"" Find symbol of current document.
	"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	"" Search workspace symbols.
	"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	"" Do default action for next item.
	"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	"" Do default action for previous item.
	"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	"" Resume latest coc list.
	"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
	
	"" Coc-explorer remap
	"nmap <space>e :CocCommand explorer<CR>
	"nmap <space>f :CocCommand explorer --preset floating<CR>
	"autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

	"" To enable highlight current symbol on CursorHold, add:
	"autocmd CursorHold * silent call CocActionAsync('highlight')


" CoC Confiuration End
