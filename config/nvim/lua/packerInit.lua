return require('packer').startup(function(use)


-- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use 'williamboman/mason.nvim'
    -- use 'williamboman/mason-lspconfig.nvim' 
    -- use 'neovim/nvim-lspconfig'
    use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
  --  use {'VonHeikemen/lsp-zero.nvim', branch = 'v1.x',
  --    requires = {
  --  -- LSP Support
  --    {'neovim/nvim-lspconfig'},             -- Required para habilitar el uso de servidores de lenguaje
  --    {'williamboman/mason.nvim'},           -- Optional instalar servidores de forma grafica 
  --    {'williamboman/mason-lspconfig.nvim'}, -- Optional configurar servidores de forma automatica

  --  -- Autocompletion
  --    {'hrsh7th/nvim-cmp'},         -- Required
  --    {'hrsh7th/cmp-nvim-lsp'},     -- Required
  --    {'hrsh7th/cmp-buffer'},       -- Optional
  --    {'hrsh7th/cmp-path'},         -- Optional
  --    {'saadparwaiz1/cmp_luasnip'}, -- Optional
  --    {'hrsh7th/cmp-nvim-lua'},     -- Optional

  --  -- Snippets
  --    {'L3MON4D3/LuaSnip'},             -- Required
  --    {'rafamadriz/friendly-snippets'}, -- Optional
  --    }
  --  }

--Multicursor

    use 'terryma/vim-multiple-cursors'
--Instala otros plugins
    use(  'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )

--TEMAS
   -- use 'ellisonleao/gruvbox.nvim'
    -- use 'joshdick/onedark.vim'
--    use 'patstockwell/vim-monokai-tasty'
   -- use 'crusoexia/vim-monokai'
   -- Using Packer
use 'navarasu/onedark.nvim'
   

--Resalta de color varios lenguajes de programacion
   -- use 'sheerun/vim-polyglot'

--"insertar color, alt +c, atl + r; alt + v
    use 'KabbAmine/vCoolor.vim'   
    --plugins para javascript
    --use 'pangloss/vim-javascript'
    --use 'maxmellon/vim-jsx-pretty' --Incluido en vim polyglot

--snippets para javascript
    use 'SirVer/ultisnips'
    use 'mlaursen/vim-react-snippets'

--Speed up loading Lua modules in Neovim to improve startup time.
    use 'lewis6991/impatient.nvim'

--prettier javascript
    use 'sbdchd/neoformat' 

--Instalar otros plugins

--Ver los registros
    use 'junegunn/vim-peekaboo'

--Surround
    use 'tpope/vim-surround'

--Cierre de etiquetas HTML
--    use 'alvan/vim-closetag'

--Exploradores de archivos
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-tree/nvim-tree.lua'
    --use 'ptzz/lf.vim'
    --use 'scrooloose/nerdtree'

--Colocar Iconos en el exploradorde archivos
--    use 'ryanoasis/vim-devicons'
    use 'nvim-tree/nvim-web-devicons' 

--Para tener una ventana flotante dentro de vim
    use 'voldikss/vim-floaterm' 


--EMMET para escribir codigo mas rapido HTML
   -- use 'mattn/emmet-vim'

--comentarios
    use 'tpope/vim-commentary'

--Para colocar lineas de identacion vertical
    use 'Yggdroot/indentLine'
   -- use 'lukas-reineke/indent-blankline.nvim'

--Linea de estatus para parte de arriba y abajo
    --use 'vim-airline/vim-airline'
    use  'nvim-lualine/lualine.nvim'
    use {'akinsho/bufferline.nvim', tag = "v3.*"}


    
--Muestra el color para los archivos CSS #RGB
    use 'lilydjwg/colorizer'
    -- use 'norcalli/nvim-colorizer.lua'

--Sombrea etiquetas de inicio y de salida
    use 'valloric/matchtagalways'
      
--Plegado de codigo
    -- use 'tmhedberg/simpylfold'


   
  end)
