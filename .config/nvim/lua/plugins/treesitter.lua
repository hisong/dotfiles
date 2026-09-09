return {
    -- Treesitter (main branch: Neovim 0.12.0+ 向け・新API)
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup({
                -- パーサ等のインストール先（既定のままで可）
                -- install_dir = vim.fn.stdpath('data') .. '/site',
            })

            -- 使うパーサをインストール（未導入分のみ取得）
            require('nvim-treesitter').install({
                'lua',
                'vim',
                'vimdoc',
                'query',
                'markdown',
                'markdown_inline',
                'bash',
            })

            -- main ブランチは highlight/indent モジュールを持たないため、
            -- Neovim 標準機能を FileType で自前に有効化する。
            vim.api.nvim_create_autocmd('FileType', {
                pattern = {
                    'lua',
                    'vim',
                    'help',
                    'markdown',
                    'markdown_inline',
                    'sh',
                    'bash',
                    'query',
                },
                callback = function()
                    -- シンタックスハイライト
                    pcall(vim.treesitter.start)
                    -- インデント（treesitter ベース）
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
