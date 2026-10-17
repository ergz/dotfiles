if not vim.g.neovide then
	return
end

local default_font = "JetBrains Mono:h20"
vim.o.guifont = default_font
vim.g.neovide_theme = "dark"
vim.g.neovide_scroll_animation_length = 0.12

-- :Font 18 sets the font size, :Font +1 / -1 changes it, :Font alone resets to the default.
vim.api.nvim_create_user_command("Font", function(opts)
	if opts.args == "" then
		vim.o.guifont = default_font
		return
	end
	local size = tonumber(opts.args)
	if opts.args:match("^[+-]") then
		size = tonumber(vim.o.guifont:match(":h([%d.]+)")) + size
	end
	vim.o.guifont = vim.o.guifont:gsub(":h[%d.]+", "") .. ":h" .. size
end, { nargs = "?" })
