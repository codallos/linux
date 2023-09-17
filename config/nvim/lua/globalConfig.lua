vim.g.mapleader = ','
vim.opt.encoding='utf-8'--Para soportar la ñ y otros caracteres
vim.opt.clipboard='unnamedplus'
vim.opt.mouse='a' --Permite interactuar con el mouse dentro del editor
vim.opt.scrolloff=15 --agregar margen de unas lineas cuando haces scroll"
vim.opt.syntax = 'enable'
vim.opt.cursorline = true --Para mostrar el curosor donde estamos
vim.opt.wildmenu = true --pequeño autocompletado al insertar un comando"
vim.opt.number = true --para que aparezcan los numeros
vim.opt.showcmd = true --muestra los comandos que estamos ejecutando
vim.opt.showmatch  = true --muestra donde termina un corchete o parentesis
vim.opt.relativenumber = true --Establece la linea actual como cero 
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.sw=2 --Coloca el tab en 2
vim.opt.signcolumn = "yes"
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
--vim.cmd 'autocmd CmdlineLeave /,? :set nohlsearch'

--Configuracion de plugins
vim.g['UtilSnipsExpandTrigger'] = '<tab>'
-- vim.g['SimpylFold_docstring_preview'] = 1
vim.g['neoformat_try_formatprg'] = 1
--vim.g['indentLine_char_list'] = '|'
vim.g['onedark_hide_endofbuffer'] = 1


--Mapeo de teclas
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<F3>', ':NvimTreeToggle<CR>',opts)
vim.keymap.set('n', '<F2>', ':NvimTreeFocus<CR>',opts)
vim.keymap.set('n', '<c-t>', ':split<CR>:ter<CR>:resize 15<CR>',opts)
vim.keymap.set('n', '<M-UP>', ':.m-2<CR>',opts)
vim.keymap.set('n', '<M-DOWN>', ':.m+1<CR>',opts)
vim.keymap.set('n', '<c-UP>', ':.m-2<CR>',opts)
vim.keymap.set('n', '<c-DOWN>', ':.m+1<CR>',opts)
vim.keymap.set('n', '<Leader>p', ':Prettier<CR>',opts)
vim.keymap.set('n', '<Leader>g' , ':w<CR>',opts)
vim.keymap.set('n', '<C-s>' , ':w<CR>',opts)
vim.keymap.set('i', '<C-s>' , '<Esc>:w<CR>i',opts)
vim.keymap.set('i', '<C-p>' , '<Esc>:Prettier<CR>i',opts)
vim.keymap.set('n', '<Leader>o', 'o<Esc><CR>',opts)
vim.keymap.set('n', '<Leader>l', ':bnext<CR>',opts)
vim.keymap.set('n', '<Leader>h', ':bprev<CR>',opts)
vim.keymap.set('n', '<Leader>c', ':Commentary<CR>',opts)


--imap <C-K> <Esc> :bprev<CR>a
--imap <C-L> <Esc> :bnext<CR>a
--nnoremap <Leader>h :bprev<CR>
--nnoremap <Leader>l :bnext<CR>
--nnoremap <space>/ :Commentary<CR>
--vnoremap <space>/ :Commentary<CR>
vim.cmd [[
"let g:onedark_hide_endofbuffer = 1
  set nohlsearch

  "colorscheme onedark
  "colorscheme monokai
  "colorscheme one-monokai

  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,typescript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.ts,*.js,*.jsx Neoformat
  augroup END
]]
