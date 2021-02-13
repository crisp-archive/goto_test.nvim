local api = vim.api

local function get_file_name()
    local cur_buf = api.nvim_get_current_buf()
    local path = api.nvim_buf_get_name(cur_buf)

    return path
end

local function valid_file(fn)
    if vim.endswith(fn, "_test.go") then
        return 1
    elseif vim.endswith(fn, ".go") then
        return 0
    end

    return -1
end

local function goto_test()
    local cur_path = get_file_name()
    local new_fn
    local vf = valid_file(cur_path)
    if vf == 1 then
        new_fn = cur_path:gsub("_test.go$", ".go")
    elseif vf == 0 then
        new_fn = cur_path:gsub(".go$", "_test.go")
    else
        -- not even a `.go file
        return
    end
    print(new_fn)

    api.nvim_command('edit' .. new_fn)
end

return {
    goto_test = goto_test
}
