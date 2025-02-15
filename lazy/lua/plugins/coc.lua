return {
    {
        "neoclide/coc.nvim",
        branch = "release",
        build = "npm ci",

        config = function()
        vim.cmd([[
            function! CocAutoInstall()
                let extensions = [
                    \"coc-actions",
                    \"coc-cspell-dicts", 
                    \"coc-dictionary", 
                    \"coc-eslint", 
                    \"coc-git", 
                    \"coc-highlight",
                    \"coc-json", 
                    \"coc-lists", 
                    \"coc-markdownlint", 
                    \"coc-metals", 
                    \"coc-pairs", 
                    \"coc-prettier", 
                    \"coc-snippets", 
                    \"coc-spell-checker", 
                    \"coc-tslint-plugin", 
                    \"coc-tsserver", 
                    \"coc-ultisnips", 
                    \"coc-yaml",
                    \"coc-pyright",
                    \"coc-sql",
                    \"coc-toml",
                    \"coc-html",
                \]

                let installed = CocAction('extensionStats')->map({ idx, ext -> ext.id })
                let missing = filter(extensions, {idx, ext -> index(installed, ext) == -1 })

                if len(missing) > 0
                    execute "CocInstall -sync " . join(missing, " ")
                endif
            endfunction

            augroup CocAutoInstall
                autocmd!
                autocmd User CocNvimInit call CocAutoInstall()
            augroup END
        ]])
        -- 以下はキー割り当ての設定です

        -- <c-space> を押したときに補完をトリガーする
        vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', { noremap = true, expr = true, silent = true })

        vim.api.nvim_set_keymap('n', '[d', '<Plug>(coc-diagnostic-prev)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', ']d', '<Plug>(coc-diagnostic-next)', { noremap = true, silent = true })

        -- Remap keys for gotos
        vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = true, silent = true })

        -- Use K to show documentation in preview window
        vim.api.nvim_set_keymap('n', 'K', ':lua show_documentation()<CR>', { noremap = true, silent = true })

        -- Define show_documentation function
        _G.show_documentation = function()
            if vim.tbl_contains({ 'vim', 'help' }, vim.bo.filetype) then
                vim.cmd('h ' .. vim.fn.expand('<cword>'))
            else
                vim.fn.CocAction('doHover')
            end
        end

        -- Highlight symbol under cursor on CursorHold
        vim.cmd([[
            autocmd CursorHold * silent call CocActionAsync('highlight')
            highlight CocErrorSign ctermfg=15 ctermbg=196
            highlight CocWarningSign ctermfg=0 ctermbg=172
        ]])

        -- Remap for rename current word
        vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { noremap = true, silent = true })

        -- Remap for format selected region
        vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', { noremap = true, silent = true })

        -- Auto commands for specific filetypes
        vim.cmd([[
            augroup mygroup
                autocmd!
                autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
                autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            augroup end
        ]])

        -- Remap for do codeAction of selected region
        vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })

        -- Remap for do codeAction of current line
        vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', { noremap = true, silent = true })

        -- Fix autofix problem of current line
        vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', { noremap = true, silent = true })

        -- Create mappings for function text object
        vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', { noremap = true, silent = true })

        -- Use <C-d> for select selections ranges (needs server support)
        -- vim.api.nvim_set_keymap('n', '<C-d>', '<Plug>(coc-range-select)', { noremap = true, silent = true })
        -- vim.api.nvim_set_keymap('x', '<C-d>', '<Plug>(coc-range-select)', { noremap = true, silent = true })

        -- Use `:Format` to format current buffer
        vim.cmd([[command! -nargs=0 Format :call CocAction('format')]])

        -- Use `:Fold` to fold current buffer
        vim.cmd([[command! -nargs=? Fold :call CocAction('fold', <f-args>)]])
        -- Use `:OR` for organize import of current buffer
        vim.cmd([[command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')]])

        -- Add status line support
        vim.opt.statusline = "%{coc#status()}%{get(b:,'coc_current_function','')}"

        -- Using CocList to show diagnostics and other actions
        vim.api.nvim_set_keymap('n', '<space>a', ':<C-u>CocList diagnostics<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>e', ':<C-u>CocList extensions<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>c', ':<C-u>CocList commands<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>o', ':<C-u>CocList outline<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>j', ':<C-u>CocNext<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>k', ':<C-u>CocPrev<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<space>p', ':<C-u>CocListResume<CR>', { noremap = true, silent = true })

        -- Switch window using <Return><Return>
        vim.api.nvim_set_keymap('n', '<Return><Return>', '<c-w><c-w>', { noremap = true, silent = true })

        -- Format the current file using `=`
        vim.api.nvim_set_keymap('n', '=', ':CocCommand prettier.formatFile<CR>', { noremap = true, silent = true })
    end,
    }
}
