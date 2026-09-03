local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local lock = vim.json.decode(table.concat(vim.fn.readfile(lockfile), '\n'))
    local lazy_commit = assert(lock['lazy.nvim'] and lock['lazy.nvim'].commit, 'lazy.nvim is missing from lazy-lock.json')
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', lazyrepo, lazypath })
    if vim.v.shell_error == 0 then
        out = vim.fn.system({ 'git', '-C', lazypath, 'checkout', lazy_commit })
    end
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    lockfile = lockfile,
    spec = {
        { import = 'plugins' },
    },
    checker = { enabled = false },
})
