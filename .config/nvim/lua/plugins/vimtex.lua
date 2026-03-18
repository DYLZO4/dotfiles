return {
  "lervag/vimtex",
  lazy = false, -- load immediately for LaTeX files
  init = function()
    -- Filetype detection
    vim.g.tex_flavor = "latex"

    -- Compiler method
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
    vim.g.vimtex_compiler_bib_backend = 'biber'

    -- PDF viewer (change this to match your system)
    -- Common: zathura, skim, okular, sumatrapdf, etc.
    vim.g.vimtex_view_method = "zathura"

    -- Enable inverse search
    vim.g.vimtex_view_forward_search_on_start = 0

    -- Syntax conceal settings
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 0,
      greek = 1,
      math_bounds = 0,
      math_delimiters = 0,
      math_fracs = 0,
      math_super_sub = 0,
      math_symbols = 1,
      sections = 0,
      styles = 0,
    }

    -- Ignore mappings from VimTeX (use your own keymaps)
    vim.g.vimtex_mappings_enabled = 1

    -- Quickfix mode
    vim.g.vimtex_quickfix_mode = 0
  end
}

