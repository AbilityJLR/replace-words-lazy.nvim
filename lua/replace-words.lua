local function create_input_window(prompt)
    local width = 40
    local height = 1
    local buf = vim.api.nvim_create_buf(false, true)

    -- Get cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row = cursor[1]
    local col = cursor[2]

    -- Adjust position to be visible
    local win_width = vim.api.nvim_win_get_width(0)

    if row - 2 < 0 then
        row = 2
    end
    if col + width > win_width then
        col = win_width - width
    end

    -- Build the top and bottom borders
    local top_border = "╭" .. string.rep("─", width - 2) .. "╮"
    local bottom_border = "╰" .. string.rep("─", width - 2) .. "╯"

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "cursor",
        row = -2,
        col = 0,
        width = width,
        height = height + 2,  -- Adjusted height for top and bottom borders
        style = "minimal",
        border = {
            {top_border, "FloatBorder"},
            {"│ " .. prompt .. string.rep(" ", width - #prompt - 3) .. "│", "FloatBorder"},
            {bottom_border, "FloatBorder"},
        },
    })

    -- Set up a keymap to exit insert mode and close the window with <Esc>
    vim.api.nvim_buf_set_keymap(
        buf,
        "i",
        "<Esc>",
        "<C-\\><C-n>:bwipeout!<CR>",
        { noremap = true, silent = true }
    )

    -- Start insert mode and move cursor to the user input position
    vim.cmd("startinsert")
    vim.api.nvim_win_set_cursor(win, { height, #prompt + 3 })

    return buf, win
end

local function get_input(prompt)
    local buf, win = create_input_window(prompt)
    local result = nil
    local co = coroutine.create(function()
        local _, input = coroutine.yield()
        result = input
        vim.api.nvim_win_close(win, true)
        vim.api.nvim_buf_delete(buf, { force = true })
    end)

    coroutine.resume(co)
    return function(text)
        coroutine.resume(co, text)
    end, result
end

local function get_word_under_cursor()
    return vim.fn.expand("<cword>")
end

local function replace_words()
    local word_to_replace = get_word_under_cursor()
    local input_callback, result = get_input("Replace all '" .. word_to_replace .. "' with:")

    if result and result ~= "" then
        vim.cmd(string.format("%%s/\\<%s\\>/%s/g", word_to_replace, result))
        print("Replaced '" .. word_to_replace .. "' with '" .. result .. "'")
    end
end

local function setup_commands_and_mappings()
    vim.api.nvim_command('command! -nargs=0 ReplaceWord lua require("my_module").replace_words()')
    vim.api.nvim_set_keymap('n', '<leader>cw', '<cmd>ReplaceWord<CR>', { noremap = true, silent = true, desc = 'Change word under cursor' })
end

local M = {}

function M.setup()
    setup_commands_and_mappings()
end

return M
