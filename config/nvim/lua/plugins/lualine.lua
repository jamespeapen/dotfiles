local os_icon = {
    ["AlmaLinux"] = {
        icon = " ",
        color = "#FFFFFF",
    },
    ["Alpine Linux"] = {
        icon = " ",
        color = "#0d597f",
    },
    ["Arch Linux"] = {
        icon = " ",
        color = "#1793d1",
    },
    ["Artix Linux"] = {
        icon = " ",
        color = "#07a1cd",
    },
    ["CoreOS"] = {
        icon = " ",
        color = "#3c6eb4",
    },
    ["Debian GNU/Linux"] = {
        icon = " ",
        color = "#dd1155",
    },
    ["Deepin"] = {
        icon = " ",
        color = "#00b7ff",
    },
    ["Devuan"] = {
        icon = " ",
        color = "#000000",
    },
    ["elementary OS"] = {
        icon = " ",
        color = "#3689e6",
    },
    ["EndeavourOS"] = {
        icon = " ",
        color = "#7f3fbf",
    },
    ["Gentoo"] = {
        icon = " ",
        color_light = "#54487a",
        color = "#61538d",
    },
    ["Fedora Linux"] = {
        icon = " ",
        color = "#3c6eb4",
        color_light = "#294172",
    },
    ["FreeBSD"] = {
        icon = " ",
        color = "#ff3300",
    },
    ["Kali GNU/Linux"] = {
        icon = " ",
        color = "#FFFFFF",
        color_light = "#0000",
    },
    ["Manjaro Linux"] = {
        icon = " ",
        color = "#35bf5c",
    },
    ["NixOS"] = {
        icon = " ",
        color = "#7ebae4",
        color_light = "#5277c3",
    },
    ["OpenBSD"] = {
        icon = " ",
        color = "#fef67a",
        color_light = "#f2ca30",
    },
    ["Linux Mint"] = {
        icon = "󰣭 ",
        color = "#87cf3e",
    },
    ["openSUSE Leap"] = {
        icon = " ",
        color = "#73ba25",
    },
    ["ParrotOS"] = {
        icon = " ",
        color = "#05eeff",
    },
    ["Pop!_OS"] = {
        icon = " ",
        color = "#6cc7d2",
    },
    ["Raspbian GNU/Linux"] = {
        icon = " ",
        color = "#bc1142",
    },
    ["Red Hat Enterprise Linux"] = {
        icon = "󱄛 ",
        color = "#ee0000",
    },
    ["Red Hat Enterprise Linux Server"] = {
        icon = "󱄛 ",
        color = "#ee0000",
    },
    ["Rocky Linux"] = {
        icon = " ",
        color = "#10b981",
    },
    ["Slackware"] = {
        icon = " ",
        color = "#a6b3da",
        color_light = "#4962ae",
    },
    ["Solus"] = {
        icon = " ",
        color = "#5294e2",
        color_light = "#4c5263",
    },
    ["Ubuntu"] = {
        icon =  " ",
        color = "#e95420",
    },
    ["Void Linux"] = {
        icon =  " ",
        color = "#abc2ab",
        color_light = "#478061",
    },
    ["ZorinOS"] = {
        icon =  " ",
        color = "#15a6f0",
        color_light = "#478061",
    },
}

local osname = os.getenv("OS_RELEASE")
if not osname then
  osname = "Linux"
end
vim.g.os_icon = os_icon[osname].icon
vim.g.os_icon_color = os_icon[osname].color

local goyo_group = vim.api.nvim_create_augroup("GoyoGroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    desc = "Hide lualine on goyo enter",
    group = goyo_group,
    pattern = "GoyoEnter",
    callback = function()
        require("lualine").hide()
    end,
})
vim.api.nvim_create_autocmd("User", {
    desc = "Show lualine after goyo exit",
    group = goyo_group,
    pattern = "GoyoLeave",
    callback = function()
        require("lualine").hide({ unhide = true })
    end,
})

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {
        'encoding',
        { 'g:os_icon', color = {fg = vim.g.os_icon_color} },
        {'filetype', icon_only = true},
      },
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}

  }
}
