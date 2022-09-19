-- toggle ----------------------------------------------------------------------
local function toggle_autoformat()
    if vim.b.autoformat == 1 then
        print 'autoformat off'
        vim.cmd [[AutoFormatOff]]
    else
        print 'autoformat on'
        vim.cmd [[AutoFormatOn]]
    end
end
