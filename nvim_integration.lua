-- if you want to integrate this in lua, you can use this file as a reference
-- and copy the functions you need to your lua file


-- the process is simple, you need to get the full path of the file you want
-- to write to /tmp/matlab_live_script and attach an event to write to that file

-- create the function that will write to the file
local function write_to_file(file_path)
    -- MAKE SURE TO CHANGE THE PATH TO THE FILE YOU WANT TO WRITE TO
    local tmp_file = "/tmp/matlab_live_script"
    -- open the file for writing
    local file = io.open(tmp_file, "w")
    -- check for nil
    if file == nil then
        print("Error opening file")
        return
    end
    file:write(file_path)
    -- close the file
    file:close()

end


-- create the autocmd to write to the file and call the function
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("matlab_sg_file", {clear = true}),
    pattern = "*.m",
    callback = function()
        local current_matlab_file = vim.fn.expand('%:p')
        write_to_file(current_matlab_file)
    end
})
