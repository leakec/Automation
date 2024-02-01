-- Copy/paste across terminals and SSH

return {
    'karb94/neoscroll.nvim',

    config = function()

        function copyp()
            if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
                require('osc52').copy_register('+')
            end
        end

        function copy()
            if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
                require('osc52').copy_register('')
            end
        end

        vim.api.nvim_create_autocmd('TextYankPost', {callback = copyp})
        vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
        vim.opt.clipboard = "unnamedplus"

    end
}
