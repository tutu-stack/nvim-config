return {
	"mhinz/vim-startify",
	config = function ()
		vim.g.startify_session_dir = '~/.local/share/nvim/session'
		vim.cmd [[
			let g:startify_lists = [
				\ { 'type': 'files',     'header': ['   Files']            },
				\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
				\ { 'type': 'sessions',  'header': ['   Sessions']       },
				\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ ]

			let g:startify_bookmarks = [
				\ { 'i': '~/.config/nvim/init.lua' },
				\ { 'z': '~/.zshrc' },
				\ { 'b': '~/.bashrc' },
				\ { 's': '~/.ssh/config' },
				\ { 't': '/tmp' },
				\ { 'K': '~/.config/kitty/kitty.conf' },
				\ { 'h': '~/.hammerspoon/customer.lua' },
				\ { 'w': '~/.config/warpd/config' },
				\ { 'v': '~/.vsnip/javascript.json' },
				\ { 'l': '/tmp/startify-play' },
				\ { 'm': '~/.config/tmuxinator' },
			\ ]
		]]
	end
}
