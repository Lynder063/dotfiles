return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  config = function()
    -- VimTeX configuration goes here, e.g.
    vimtex_view_method = "zathura"
		vimtex_compiler_method = 'latexrun'
		maplocalleader = ","
  end
}
