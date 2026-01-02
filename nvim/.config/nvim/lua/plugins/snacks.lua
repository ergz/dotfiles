local helix_style = {
  layout = {
    box = "horizontal",
    width = 0.8,
    min_width = 120,
    height = 0.8,
    border = "single",
    title = "{source}",
    title_pos = "right",
    {
      box = "vertical",
      border = "none",
      { win = "input", height = 1, border = "bottom" },
      { win = "list", border = "none" },
    },
    { win = "preview", title = "{preview}", border = "left", width = 0.5 },
  },
}

local sidebar_single_border = {
  layout = {
    backdrop = false,
    width = 40,
    min_width = 40,
    height = 0,
    position = "left",
    border = "none",
    box = "vertical",
    {
      win = "input",
      height = 1,
      border = "single",
      title = "{title} {live} {flags}",
      title_pos = "center",
    },
    { win = "list", border = "none" },
    { win = "preview", title = "{preview}", height = 0.4, border = "top" },
  },
}

local vscode_layout_custom = {
  preview = false,
  layout = {
    backdrop = false,
    row = 1,
    width = 0.4,
    min_width = 80,
    height = 0.4,
    border = "single",
    box = "vertical",
    { win = "input", height = 1, border = "single", title = "{title} {live} {flags}", title_pos = "center" },
    { win = "list", border = "hpad" },
    { win = "preview", title = "{preview}", border = "single" },
  },
}

return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  ---@type snacks.Config
  opts = {
    picker = {
      enabled = true,
      ui_select = true,
      layout = helix_style,
      sources = {
        smart = {
          layout = helix_style,
          icons = { files = { enabled = false } },
        },
        lsp_symbols = {
          layout = helix_style,
        },
        grep = { layout = helix_style },
        files = {
          finder = "files",
          format = "file",
          show_empty = true,
          hidden = true,
          ignored = true,
          follow = false,
          supports_live = true,
          layout = helix_style,
          icons = { files = { enabled = false } },
        },
        explorer = {
          auto_close = true,
          layout = sidebar_single_border,
          watch = true,
          hidden = true,
        },
        buffers = {
          finder = "buffers",
          format = "buffer",
          -- layout = helix_style,
          layout = vscode_layout_custom,
          hidden = false,
          unloaded = true,
          current = false,
          sort_lastused = true,
          win = {
            input = {
              keys = {
                ["dd"] = "bufdelete",
                ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
              },
            },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
    ---@type table<string, snacks.win.Config>
    styles = {
      notification = { border = "single" },
      input = { border = "single" },
      notification_history = { border = "single" },
    },

    ---@class snacks.lazygit.Config: snacks.terminal.Opts
    ---@field args? string[]
    ---@field theme? snacks.lazygit.Theme
    lazygit = {
      theme = {
        selectedLineBgColor = { bg = "Normal", bold = false },
        activeBorderColor = { fg = "String" },
        inactiveBorderColor = { fg = "Comment" },
        defaultFgColor = { fg = "Normal", bold = false },
      },
    },
    ---@class snacks.input.Config
    input = {
      enabled = true,
    },
    ---@class snacks.words.Config
    words = { enabled = false },
    scroll = { enabled = false },
    dim = { enabled = false },
    ---@class snacks.notifier.Config
    notifier = {
      enabled = true,
      padding = false,
      style = "compact",
      win = {
        border = "single",
      },
    },
    ---@class snacks.indent.Config
    indent = {
      enabled = true,
      indent = {
        char = "│",
      },
      animate = {
        style = "out",
        easing = "linear",
        duration = {
          total = 200,
        },
      },
      scope = {
        underline = true,
      },
      chunk = {
        enabled = true,
        char = {
          arrow = "─",
          -- corner_top = "╭",
          -- corner_bottom = "╰",
        },
      },
    },
    terminal = { enabled = true },
  },
  keys = {
    {
      "<D-\\>",
      function()
        Snacks.picker.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<A-\\>",
      function()
        Snacks.picker.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>p",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<C-p>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    --- make notifications look like the nvim-notify ones
    vim.api.nvim_set_hl(0, "SnacksNotifierIconError", { fg = "#F70067" })
    vim.api.nvim_set_hl(0, "SnacksNotifierTitleError", { fg = "#F70067" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderError", { fg = "#8A1F1F", bold = true })
    vim.api.nvim_set_hl(0, "SnacksNotifierFooterError", { fg = "#F70067", italic = true })

    vim.api.nvim_set_hl(0, "SnacksNotifierIconWarn", { fg = "#F79000" })
    vim.api.nvim_set_hl(0, "SnacksNotifierTitleWarn", { fg = "#F79000" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderWarn", { fg = "#79491D" })
    vim.api.nvim_set_hl(0, "SnacksNotifierFooterWarn", { fg = "#F79000", italic = true })

    vim.api.nvim_set_hl(0, "SnacksNotifierIconInfo", { fg = "#A9FF68" })
    vim.api.nvim_set_hl(0, "SnacksNotifierTitleInfo", { fg = "#A9FF68" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderInfo", { fg = "#4F6752" })
    vim.api.nvim_set_hl(0, "SnacksNotifierFooterInfo", { fg = "#A9FF68", italic = true })

    vim.api.nvim_set_hl(0, "SnacksNotifierIconDebug", { fg = "#8B8B8B" })
    vim.api.nvim_set_hl(0, "SnacksNotifierTitleDebug", { fg = "#8B8B8B" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderDebug", { fg = "#8B8B8B" })
    vim.api.nvim_set_hl(0, "SnacksNotifierFooterDebug", { fg = "#8B8B8B", italic = true })

    vim.api.nvim_set_hl(0, "SnacksNotifierIconTrace", { fg = "#D484FF" })
    vim.api.nvim_set_hl(0, "SnacksNotifierTitleTrace", { fg = "#D484FF" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderTrace", { fg = "#4F3552" })
    vim.api.nvim_set_hl(0, "SnacksNotifierFooterTrace", { fg = "#D484FF", italic = true })

    vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#adadad" })
    vim.api.nvim_set_hl(0, "SnacksPickerFile", { bold = true })

    -- vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#00b08d" })
    -- vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#2b8fff" })
  end,
}
