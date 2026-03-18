return {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
        require("colorizer").setup({
            "*",
        }, {
            RGB      = true,
            RRGGBB   = true,
            names    = false,
            RRGGBBAA = true,
            css      = true,
            css_fn   = true,
        })
    end,
}
