return {
    -- Japanese input (SKK)
    {
        'vim-skk/skkeleton',
        dependencies = {
            'vim-denops/denops.vim',
        },
        config = function()
            vim.fn['skkeleton#config']({
                completionRankFile = vim.fn.expand('~/.config/skk/my_rank.json'),
                databasePath = vim.fn.expand('~/.config/skk/my_denokv'),
                eggLikeNewline = true,
                lowercaseMap = {
                    [':'] = ';',
                    ['+'] = ';',
                },
                globalDictionaries = {
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.L'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.jinmei'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.itaiji'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.geo'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.station'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.propernoun'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.law'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.emoji'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.edict'),
                    vim.fn.expand('~/.config/skk/dict/SKK-JISYO.edict2'),
                    vim.fn.expand('~/.config/skk/dict/zipcode/SKK-JISYO.zipcode'),
                },
                immediatelyCancel = false,
                keepState = true,
            --  markerHenkan = '▿',
            --  markerHenkanSelect = '▾',
                registerConvertResult = true,
            --  selectCandidateKeys = 'asdfjkl',
                setUndoPoint = false,
                showCandidatesCount = 1,
                sources = {'deno_kv'},
                userDictionary = vim.fn.expand('~/.config/skk/my_jisyo'),
            })

            -- 自分用のかなテーブル
            vim.fn['skkeleton#register_kanatable']('rom', {
                [';']   = {'っ', ''},
                ['z;']  = {'：', ''},
                ['z:']  = {'；', ''},
                ['(']   = {'（', ''},
                [')']   = {'）', ''},
                ['l']   = false,
                ['la']  = {'ぁ', ''},
                ['li']  = {'ぃ', ''},
                ['lu']  = {'ぅ', ''},
                ['le']  = {'ぇ', ''},
                ['lo']  = {'ぉ', ''},
                ['ltu'] = {'っ', ''},
                ['lya'] = {'ゃ', ''},
                ['lyu'] = {'ゅ', ''},
                ['lyo'] = {'ょ', ''},
                ['lwa'] = {'ゎ', ''},
            })
            -- AZIK 拡張ローマ字（有効化する場合はコメントを外す）
            -- require('skkeleton_azik')

            -- keymaps
            vim.keymap.set({'i', 'c', 't'}, '<C-j>', '<Plug>(skkeleton-enable)',  { noremap = false })
            vim.keymap.set({'i', 'c', 't'}, '<C-l>', '<Plug>(skkeleton-disable)', { noremap = false })
        end,
    },

    -- SKK mode indicator
    {
        'delphinus/skkeleton_indicator.nvim',
        dependencies = {
            'vim-skk/skkeleton',
        },
        config = function()
            require('skkeleton_indicator').setup {}
        end,
    },
}
