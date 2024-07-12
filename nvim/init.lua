
vim.cmd([[
call plug#begin()
    Plug 'dracula/vim', { 'as': 'dracula-vim'}
    Plug 'xiyaowong/transparent.nvim'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'catppuccin/vim', { 'as': 'catpuccin' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'easymotion/vim-easymotion'
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'gelguy/wilder.nvim'
    Plug 'roxma/nvim-yarp',  { 'do': 'pip install -r requirements.txt' }
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'mrcjkb/rustaceanvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-surround'
    Plug 'm4xshen/autoclose.nvim'
    Plug 'goolord/alpha-nvim'
call plug#end()
]])

-- PLUGINS SETUP

require("ibl").setup()
require("autoclose").setup()
-- START SCREEN

local dash_config = require("alpha.themes.dashboard")
dash_config.section.header.val = {[[
[[    		 M.					   .:M 
[[		MMMM.					.:MMMM
[[		MMMMMMMM			     .:MMMMMMM
[[		:MMHHHMMMMHMM.	.:MMMMMMMMM:.	   .:MMHHMHMM:
		 [ [ :MMHHIIIHMMMM.:MMHHHHIIIHHMMMM. .:MMHIHIIHHM: ] ]
		  [ [ MMMHIIIIHHMMMIIHHMHHIIIIIHHMMMMMMHHHIIIIHHM: ] ]
		  [ [ :MMHIIIIIHMMMMMMMHHIIIIIIHHHMMMMMHHII:::IHM. ] ]
		  [ [  MH:I:::IHHMMMMMHHII:::IIHHMMMHHHMMM:I:IHMM ] ]
		   :MHI:HHIHMMHHIIHII::.::IIHMMHHIHHMMM::HMM:
		    MI::HHMMIIM:IIHII::..::HM:MHHII:::IHHMM:
		    MMMHII::..:::IHMMHHHMHHMMI:::...::IHM:
		    :MHHI::....::::HMMMMMMHHI::.. ..:::HM:
		     :MI:.:MH:.....:HMMMMHHMIHMMHHI:HH.:M
		     M:.I..MHHHHHMMMIHMMMMHMMHHHHHMMH:.:M.
		     M:.H..H  I:HM:MHMHI:IM:I:MM::  MMM:M:
		     :M:HM:.M I:MHMIIMMIIHM I:MM::.:MMI:M.
		     'M::MM:IMH:MMII MMHIMHI :M::IIHMM:MM
		      MH:HMMHIHMMMMMMHMMIMHIIHHHHIMMHHMM
		       MI:MMMMHI:::::IMM:MHI:::IMMMMHIM
			:IMHIHMMMMMM:MMMMMHHHHMMMHI:M
			 HI:IMIHMMMM:MMMMMMHHHMI:.:M	  .....
	     ............M::..:HMMMMIMHIIHMMMMHII:M:::''''
		 ....:::MHI:.:HMMMMMMMMHHHMHHI::M:::::::''''''
		''   ...:MHI:.::MMHHHMHMIHMMMMHH.MI..........
		   ''  ...MHI::.::MHHHHIHHMM:::IHM           '''
		      '  IMH.::..::HMMHMMMH::..:HM:
			:M:.H.IHMIIII::IIMHMMM:H.MH
			 IMMMH:HI:MMIMI:IHI:HIMIHM:
		       .MMI:.HIHMIMI:IHIHMMHIHI:MIM.
		      .MHI:::HHIIIIIHHI:IIII::::M:IM.
		     .MMHII:::IHIII::::::IIIIIIHMHIIM
		     MHHHI::.:IHHII:::.:::IIIIHMHIIHM:
		    MHHHII::..::MII::.. ..:IIIHHHII:IM.
		   .MHHII::....:MHII::.  .:IHHHI::IIHMM.
		   MMHHII::.....:IHMI:. ..:IHII::..:HHMM
		   MHHII:::......:IIHI...:IHI::.....::HM:
		  :MMH:::........ ...::..::....  ...:IHMM
		  IMHIII:::..........	  .........::IHMM.
		  :MHIII::::......	    .......::IHMM:
		   MHHIII::::...	     ......::IHMM:
		   IMHHIII:::...	     .....::IIHMM,
		   :MHHIII:::I:::...	 ....:::I:::IIHMM
		    MMHHIII::IHI:::...........:::IIH:IHMM
		    :MMHHII:IIHHI::::::.....:::::IH:IHMIM
		     MMMHHII:IIHHI:::::::::::::IHI:IIHM:M.
		     MMMHHIII::IHHII:::::::::IHI:IIIHMM:M:
		     :MMHHHIII::IIIHHII::::IHI..IIIHHM:MHM
		     :MMMHHII:..:::IHHMMHHHHI:IIIIHHMM:MIM
		     .MMMMHHII::.:IHHMM:::IIIIIIHHHMM:MI.M
		   .MMMMHHII::.:IHHMM:::IIIIIIHHHMM:MI.M
		 .MMMMHHMHHII:::IHHMM:::IIIIIHHHHMM:MI.IM.
		.MMHMMMHHHII::::IHHMM::I&&&IHHHHMM:MMH::IM.
	       .MMHHMHMHHII:::.::IHMM::IIIIHHHMMMM:MMH::IHM
	       :MHIIIHMMHHHII:::IIHMM::IIIHHMMMMM::MMMMHHHMM.
	       MMHI:IIHMMHHHI::::IHMM:IIIIHHHMMMM:MMMHI::IHMM.
	       MMH:::IHMMHHHHI:::IHMM:IIIHHHHMMMM:MMHI:.:IHHMM.
	       :MHI:::IHMHMHHII::IHMM:IIIHHHMMMMM:MHH::.::IHHM:
	       'MHHI::IHMMHMHHII:IHMM:IIHHHHMMMM:MMHI:...:IHHMM.
		:MHII:IIHMHIHHIIIIHMM:IIHHHHMMMM:MHHI:...:IIHMM:
		'MHIII:IHHMIHHHIIHHHMM:IHHHMMMMM:MHHI:..::IIHHM:
		 :MHHIIIHHMIIHHHIHHHMM:HHHHMMMMM:MHII::::IIIHHMM
		  MHHIIIIHMMIHHHIIHHMM:HHHHMMMM:MMHHIIHIIIIIHHMM.
		  'MHHIIIHHMIIHHIIIHMM:HHHMMMMH:MHHMHII:IIIHHHMM:
		   'MHHIIIHMMIHHHIHHMM:HHHMMMHH:MMIMMMHHHIIIHHMM:
		    'MHHIIHHMIHHHHHMMM:HHHMMMH:MIMMMMMMMMMMHIHHM:
		     'MHIIIHMMIHHHHHMM:HHHMMMH:IMMMMMHHIHHHMMHHM'
		      :MHHIIHMIHHHHHMM:HHHMMMM:MMHMMHIHMHI:IHHHM
		       MHHIIHM:HHHHHMM:HHHMMMM:MMMHIHHIHMM:HHIHM
			MHHIHM:IHHHHMM:HHHHMM:MMHMIIHMIMMMHMHIM:
			:MHIHMH:HHHHMM:HHHHMM:MMHIIHMIIHHMMHIHM:
			 MMHHMH:HHHHMM:HHHHMM:MHHIHMMIIIMMMIIHM'
			 'MMMMH:HHHHMM:HHHMM:MHHHIMMHIIII::IHM:
			  :MMHM:HHHHMM:HHHMM:MHIHIMMHHIIIIIHM:
			   MMMM:HHHHMM:HHHHM:MHHMIMMMHHHIHHM:MMMM.
			   :MMM:IHHHMM:HHHMM:MHHMIIMMMHHMM:MMMMMMM:
			   :MMM:IHHHM:HHHHMM:MMHHHIHHMMM:MMMMMMMMMM
			    MHM:IHHHM:HHHMMM:MMHHHHIIIMMIIMMMMMMMMM
			    MHM:HHHHM:HHHMMM:HMMHHHHHHHHHMMMMMMMMM:
			 .MI:MM:MHHMM:MHMMHMHHMMMMHHHHHHHMMMMMMMMM'
			:IM:MMIM:M:MM:MH:MM:MH:MMMMMHHHHHMMMMMMMM'
			:IM:M:IM:M:HM:IMIHM:IMI:MMMMMHHHMMMMMM:'
			 'M:MHM:HM:MN:HMIHM::M'   '::MMMMMMM:'
			    'M'HMM'M''M''HM'I' 
                ]]}
require("alpha").setup(dash_config.config)

-- MASON/LSPCONFIG

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup({
    settings = {Lua = {diagnostics = {globals = { 'vim' }},},},
    capabilities = capabilities,
})

require("lspconfig").pylsp.setup({})


-- COMPLETIONS
local cmp = require("cmp")
cmp.setup({
    snippets = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources(
        {
            {name = 'nvim_lsp'},
            {name = 'vsnip'},
        }, {
            {name = 'buffer'},
        }
    )
})

-- WILDER CONFIG 

local wilder = require("wilder")

local gradient = { "#6e40aa","#963db3","#bf3caf","#e4419d","#fe4b83",
         "#ff5e63","#ff7847","#fb9633","#e2b72f","#c6d63c","#aff05b" }

for i, fg in ipairs(gradient) do
    gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a=1 }, {a=1}, {foreground = fg} })
end

wilder.setup({
    modes = {':', '/', '?'}
})

wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            language = 'python',
            fuzzy = '1',
        }),
        wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern(),
            sorter = wilder.python_difflib_sorter(),
            engine = 're',
        })
    ),
})

wilder.set_option('renderer', wilder.popupmenu_renderer({
    highlights = {
        border = 'Normal',
        gradient = gradient,
    },
    highlighter = {
        wilder.highlighter_with_gradient({
            wilder.basic_highlighter(),
        })
    },
    left = { ' ', wilder.popupmenu_devicons(), },
    border = 'rounded',
}))

-- GENERAL CONFIG
local o = vim.opt

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.number = true
o.cc= { 80, 100, 120 }
o.ignorecase=true
o.mouse='v'
o.mouse='a'
o.clipboard= o.clipboard + "unnamedplus"
o.encoding="utf-8"


vim.g.airline= {
    extensions = {
        tabline = {
            enable=1,
            formatter='unique_tail',
        },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function ()
        vim.cmd([[ wincmd L ]])
    end
})

vim.cmd([[
colorscheme catppuccin_frappe

 " KEYBINDINGS
nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
nnoremap <Leader>o :Files <Enter> 
nnoremap <Leader>f :Files 
nnoremap <Leader>b :Buffers <Enter>
nnoremap <Leader><C-l> :let @/ = "" <Enter>

]])
