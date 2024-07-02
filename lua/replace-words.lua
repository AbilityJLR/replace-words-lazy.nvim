local M = {}

local function create_input_window(prompt, word_to_replace)
    local width = 40
    local height = 1
    local buf = vim.api.nvim_create_buf(false, true)
    
    -- Get cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row = cursor[1]
    local col = cursor[2]
    
    -- Adjust position to be visible
    local win_height = vim.api.nvim_win_get_height(0)
    local win_width = vim.api.nvim_win_get_width(0)
    if row - 2 < 0 then
        row = 2
    end
    if col + width > win_width then
        col = win_width - width
    end
    
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "cursor",
        row = -3,
        col = 0,
        width = width,
        height = height,
        style = "minimal",
        border = {
            {"╭", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╮", "FloatBorder"},
            {"│", "FloatBorder"},
            {"╯", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╰", "FloatBorder"},
            {"│", "FloatBorder"},
        },
        title = string.format(" Replace all '%s' with ", word_to_replace),
        title_pos = "left",
    })
    
    vim.api.nvim_buf_set_option(buf, "buftype", "prompt")
    vim.fn.prompt_setprompt(buf, "")
    
    -- Set up a keymap to exit insert mode and close the window with <Esc>
    vim.api.nvim_buf_set_keymap(
        buf,
        "i",
        "<Esc>",
        "<C-\\><C-n>:bwipeout!<CR>",
        { noremap = true, silent = true }
    )
    vim.cmd("startinsert")
    return buf, win
end

local function get_word_under_cursor()
    return vim.fn.expand("<cword>")
end

local function replace_words()
    local word_to_replace = get_word_under_cursor()
    local buf, win = create_input_window("", word_to_replace)
    local result = nil
    vim.fn.prompt_setcallback(buf, function(text)
        result = text
        vim.api.nvim_win_close(win, true)
        vim.api.nvim_buf_delete(buf, { force = true })
        if result and result ~= "" then
            -- Perform substitution using :s command
            vim.cmd(string.format("%%s/\\<%s\\>/%s/g", word_to_replace, result))
            print(word_to_replace, result)
        end
    end)
end

function M.setup()
    vim.api.nvim_create_user_command("ReplaceWord", function()
        replace_words()
    end, {})
    vim.keymap.set("n", "<leader>cw", function()
        replace_words()
    end, { desc = "Change word under cursor" })
end

return M
