local new_au_cmd = vim.api.nvim_create_autocmd
local new_au_grp = vim.api.nvim_create_augroup

new_au_cmd("BufWinEnter", {
	desc = "Avoid autocomment on 'o' in commented line",
	command = "set formatoptions-=o",
})

new_au_cmd("TextYankPost", {
	desc = "Highlight on yank",
	group = new_au_grp("HighlightYank", {}),
	callback = function()
		vim.highlight.on_yank({
			higroup = "TermCursor",
			timeout = 60,
		})
	end,
})

local ftp_group = new_au_grp("FileTypeSettings", {})
new_au_cmd("FileType", {
	desc = "Disable spellcheck for certain buffers",
	group = ftp_group,
	pattern = { "man", "harpoon", "TelescopePrompt" },
	callback = function()
		vim.opt_local.spell = false
	end,
})

new_au_cmd("BufEnter", {
	desc = "Set filetype to none",
	group = ftp_group,
	callback = function()
		if vim.bo.filetype == "" then
			vim.opt_local.filetype = "none"
		end
	end,
})

new_au_cmd("FileType", {
	desc = "Enable bilingual spellcheck for certain buffers",
	group = ftp_group,
	pattern = { "gitcommit", "none" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "es", "en_us", "en_gb" }
	end,
})

new_au_cmd("FileType", {
	desc = "GoTo navigation for help files",
	group = ftp_group,
	pattern = { "help", "man" },
	callback = function()
		vim.keymap.set("n", "gd", "<C-]>")
	end,
})

new_au_cmd("BufWritePost", {
	desc = "Compile spell file bin",
	group = new_au_grp("CompileSpellFile", {}),
	pattern = "*spell.utf-8.add",
	command = "mkspell %",
})

new_au_cmd("VimEnter", {
	desc = "Set root dir",
	group = new_au_grp("SetRootOnVimEnter", {}),
	callback = function(ctx)
		local root = vim.fs.root(ctx.buf, { ".git" })
		if root then
			vim.uv.chdir(root)
		end
	end,
})
