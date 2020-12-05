-- Completion and so on

local rt = function(codes)
	return vim.api.nvim_replace_termcodes(codes, true, true, true)
end

local call = vim.api.nvim_call_function

function tab_complete()
    if vim.fn.pumvisible() == 1 then
        return rt('<C-N>')
    elseif call('vsnip#available', {1}) == 1 then
        return rt('<Plug>(vsnip-expand-or-jump)')
    else
        return rt('<Tab>')
    end
end

function s_tab_complete()
    if vim.fn.pumvisible() == 1 then
        return rt('<C-P>')
    elseif call('vsnip#jumpable', {-1}) == 1 then
        return rt('<Plug>(vsnip-jump-prev)')
    else
        return rt('<S-Tab>')
    end
end
