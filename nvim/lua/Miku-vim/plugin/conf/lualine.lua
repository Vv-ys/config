--NOTE:
local lualine = require("lualine")
local colors = {
        bg       = '#202328',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#008080',
        darkblue = '#081633',
        green    = '#98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
        purple   = '#1E50A2',
        gray     = "#bdbebd",
}

local conditions = {
        buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
                return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
}


-- local M = {}
-- M.theme = function()
--         local color = {
--                 darkgray = "#98be65",
--                 gray = "#98be65",
--                 innerbg = "#1E50A2",
--                 outerbg = "#ec5f67",
--                 normal = "#98be65",
--                 insert = "#003399",
--                 visual = "#98be65",
--                 replace = "#98be65",
--                 command = "#98be65",
--         }
--         return {
--                 inactive = {
--                         a = { fg = color.gray, bg = color.outerbg, gui = "bold" },
--                         b = { fg = color.gray, bg = color.outerbg },
--                         c = { fg = color.gray, bg = color.innerbg },
--                 },
--                 visual = {
--                         a = { fg = color.darkgray, bg = color.visual, gui = "bold" },
--                         b = { fg = color.gray, bg = color.outerbg },
--                         c = { fg = color.gray, bg = color.innerbg },
--                 },
--                 replace = {
--                         a = { fg = color.darkgray, bg = color.replace, gui = "bold" },
--                         b = { fg = color.gray, bg = color.outerbg },
--                         c = { fg = color.gray, bg = color.innerbg },
--                 },
--                 normal = {
--                         a = { fg = color.darkgray, bg = color.normal, gui = "bold" },
--                         b = { fg = color.gray, bg = color.outerbg },
--                         c = { fg = color.gray, bg = color.innerbg },
--                 },
--                 insert = {
--                         a = { fg = color.darkgray, bg = color.insert, gui = "bold" },
--                         b = { fg = color.gray, bg = color.outerbg },
--                         c = { fg = color.gray, bg = color.innerbg },
--                 },
--                 command = {
--                         a = { fg = color.darkgray, bg = color.command, gui = "bold" },
--                         b = { fg = color.gray, bg = color.outerbg },
--                         c = { fg = color.gray, bg = color.innerbg },
--                 },
--         }
-- end
--
local left = {
        --NOTE: ▊
        {
                function()
                        -- return '▊'
                        return ' '
                end,
                color = { fg = colors.purple },    -- Sets highlighting of component
                padding = { left = 0, right = 1 }, -- We don't need space before this
        },
        --NOTE: mode component
        {
                -- mode component
                function()
                        return ''
                end,
                color = function()
                        -- auto change color according to neovims mode
                        local mode_color = {
                                n = colors.red,
                                i = colors.green,
                                v = colors.blue,
                                [''] = colors.blue,
                                V = colors.blue,
                                c = colors.magenta,
                                no = colors.red,
                                s = colors.orange,
                                S = colors.orange,
                                [''] = colors.orange,
                                ic = colors.yellow,
                                R = colors.violet,
                                Rv = colors.violet,
                                cv = colors.red,
                                ce = colors.red,
                                r = colors.cyan,
                                rm = colors.cyan,
                                ['r?'] = colors.cyan,
                                ['!'] = colors.red,
                                t = colors.red,
                        }
                        return { fg = mode_color[vim.fn.mode()] }
                end,
                padding = { right = 1 },
        },
        --NOTE: filename
        {
                'filename',
                cond = conditions.buffer_not_empty,
                color = { fg = colors.magenta, gui = 'bold' },
                symbols = {
                        newfile = '', -- Text to show for new created file before first writting
                        modified = '', -- Text to show when the file is modified.
                        readonly = '', -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '', -- Text to show for unnamed buffers.
                }
        },
        --NOTE: filesize component
        {
                -- filesize component
                'filesize',
                cond = conditions.buffer_not_empty,
                color = { fg = colors.gray, gui = 'bold' }
        },
        --NOTE: location
        { 'location', color = { fg = colors.gray, gui = 'bold' } },
        --NOTE: progress
        { 'progress', color = { fg = colors.gray, gui = 'bold' } },
        --NOTE: diagnostics
        {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                        color_error = { fg = colors.red },
                        color_warn = { fg = colors.yellow },
                        color_info = { fg = colors.cyan },
                },
        },
        --NOTE:
        {
                function()
                        return '%='
                end,
        },

}

local right = {
        --NOTE: filetype
        {
                'filetype',
                icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
                color = { fg = colors.green, gui = 'bold' },
        },
        --NOTE: branch
        {
                'branch',
                icon = '',
                color = { fg = colors.violet, gui = 'bold' },
        },
        --NOTE: diff
        {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                diff_color = {
                        added = { fg = colors.green },
                        modified = { fg = colors.orange },
                        removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
        },
        --NOTE:
        {
                function()
                        return ' '
                end,
                color = { fg = colors.purple },
                padding = { left = 1 },
        },


}
-- Config
local config = {
        options = {
                -- Disable sections and component separators
                component_separators = '',
                section_separators = '',
                theme = 'auto',
                globalstatus = true,
        },
        sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                -- These will be filled later
                lualine_c = left,
                lualine_x = right,
        },
        inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
        },
}


-- vim.o.laststatus = 3
lualine.setup(config)
