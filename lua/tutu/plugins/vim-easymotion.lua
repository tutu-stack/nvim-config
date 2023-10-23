function commonHighlight()
  vim.cmd [[
    hi link EasyMotionTarget DevIconBashProfile
    highlight iCursor guifg=#FFFFFF guibg=#FF0000

    highlight ConflictMarkerBegin guibg=#2f7366
    highlight ConflictMarkerOurs guibg=#2e5049
    highlight ConflictMarkerTheirs guibg=#344f69
    highlight ConflictMarkerEnd guibg=#2f628e
    highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
  ]]

  --vim.api.nvim_exec(
  --  [[
  --  hi link EasyMotionTarget DevIconBashProfile
  --  highlight iCursor guifg=#FFFFFF guibg=#FF0000

  --  highlight ConflictMarkerBegin guibg=#2f7366
  --  highlight ConflictMarkerOurs guibg=#2e5049
  --  highlight ConflictMarkerTheirs guibg=#344f69
  --  highlight ConflictMarkerEnd guibg=#2f628e
  --  highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
  --]],
  --  false
  --)
end

return {{
		"easymotion/vim-easymotion",
		config = function ()
		 	commonHighlight()
		 	local keymap = vim.keymap
		 	local opt = { silent = true }
		    keymap.set("n", "f", "<Plug>(easymotion-overwin-f)", opt)
		 --    vim.cmd [[
			--     nmap f <Plug>(easymotion-overwin-f)
			-- ]]
		 end
}}