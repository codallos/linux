let mapleader=","
set cursorline "Para mostrar el curosor donde estamos
set scrolloff=8 "agregar margen de unas lineas cuando haces scroll"
set wildmenu "pequeño autocompletado al insertar un comando"
set number "para que aparezcan los numeros
set mouse=a " Permite interactuar con el mouse dentro del editor
syntax enable
set showcmd "muestra los comandos que estamos ejecutando
set encoding=utf-8 " Para soportar la ñ y otros caracteres
set showmatch " muestra donde termina un corchete o parentesis
set relativenumber "Establece la linea actual como cero 
set sw=2 "Coloca el tab en 2
set termguicolors
set splitbelow
set splitright
set clipboard=unnamedplus
set smartindent
set nu rnu
set nohlsearch "limpia el sobreado despues de una busqueda
"let g:NERDTreeHijackNetrw = 0 " Add this line if you use NERDTree
"let g:lf_replace_netrw = 1 " Open lf when vim opens a directory

call plug#begin('~/.vim/plugged')

Plug 'KabbAmine/vCoolor.vim'   "insertar color, alt +c, atl + r; alt + v
" Plugin para python
" Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
" Autocompletado de llaves, corchetes, presenta problemas con Coc
" Plug 'jiangmiao/auto-pairs'
" LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Cambiar el color de los parentesis y llaves
" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1

" TEMAS
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'fratajczak/one-monokai-vim'

" plugins para javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" snippets para javascript
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

"prettier javascript
Plug 'sbdchd/neoformat' 

"Instalar otros plugins
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

"Ver los registros
Plug 'junegunn/vim-peekaboo'

"Cierre de etiquetas HTML
Plug 'alvan/vim-closetag'

"Explorador alternativo a NERDTree tipo ranger
Plug 'ptzz/lf.vim'

"Para tener una ventana flotante dentro de vim
Plug 'voldikss/vim-floaterm' 

" EMMET para escribir codigo mas rapido HTML
Plug 'mattn/emmet-vim'

" comentarios
Plug 'tpope/vim-commentary'

"Para colocar lineas de identacion vertical
Plug 'Yggdroot/indentLine'

"Linea de estatus para parte de arriba y abajo
Plug 'vim-airline/vim-airline'

"Multiples cursores
Plug 'terryma/vim-multiple-cursors'

"Arbol de directorios
Plug 'scrooloose/nerdtree'

"Plegado de codigo
Plug 'tmhedberg/simpylfold'
let g:SimpylFold_docstring_preview = 1

"Colocar Iconos
Plug 'ryanoasis/vim-devicons'

"Resalta de color varios lenguajes de programacion
Plug 'sheerun/vim-polyglot'

"Muestra el color para los archivos CSS #RGB
Plug 'lilydjwg/colorizer'

"Sombrea etiquetas de inicio y de salida
Plug 'valloric/matchtagalways' 
call plug#end()

" GRUVBOX configuracion
"set background=dark
"let g:gruvbox_material_background='medium'
"colorscheme gruvbox-material
"colorscheme onedark
colorscheme one-monokai

imap <C-K> <Esc> :bprev<CR>a
imap <C-L> <Esc> :bnext<CR>a

nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>o o<Esc><CR>
nnoremap<c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-UP> :.m-2<CR>
nnoremap <c-DOWN> :.m+1<CR>
" LSP configuracion
lua << EOF
--require'lspconfig'.tsserver.setup{}
EOF

" snippets configuracion
let g:UtilSnipsExpandTrigger="<tab>"

" EMMET configuracion
"let g:user_emmet_mode='n'
let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={
\ 'javascript':{
\ 'extends':'jsx'
\ }
\ }

" Prettier configuracion
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-D> :Prettier<CR>

" configuracion de comentarios
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" configuracion de airline agregar los tabs y buffers en la parte de arriba
let g:airline#extensions#tabline#enabled = 1

" NERDTREE Configuracion
let NERDTreeQuitOnOpen=1
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" nnoremap <silent> <F2> :NERDTreeFind<CR>
""nnoremap <c-w> :NERDTreeCWD<CR>

"_________________________________________________________________________________
"COC configuracion

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"#######################################
"JS FORMAT NEOFORMAT, formateador de js, ts, react
"#######################################
"link: https://hashrocket.com/blog/posts/writing-prettier-javascript-in-vim
let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,typescript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.ts,*.js,*.jsx Neoformat
augroup END

" nnoremap <silent> <F2> :CocCommand explorer<CR>
