require('orgmode').setup({
    org_agenda_files = {
        '~/org/inbox.org',
        '~/org/todo.org',
        '~/org/meetings.org',
    },
    org_default_notes_file = '~/org/inbox.org',

    -- TODO状態
    org_todo_keywords = {
        'TODO(t)',
        'WAITING(w)',
        '|',
        'DONE(d)',
        'CANCELLED(c)',
    },

    -- 見た目
    org_startup_indented = true,
    org_hide_leading_stars = true,
    org_hide_emphasis_markers = true,

    -- 完了ログ
    org_log_done = 'time',
    org_log_into_drawer = 'LOGBOOK',

    -- Agenda/Captureを開く見た目
    win_split_mode = 'float',
    win_border = 'rounded',

    -- Capture
    org_capture_templates = {
        i = {
            description = 'Inbox',
            template = '* %?\n  %u',
            target = '~/org/inbox.org',
        },
        t = {
            description = 'ToDo',
            template = '* TODO %?\n  %u',
            target = '~/org/todo.org',
        },
        m = {
            description = 'Meeting',
            template = {
                '* %<%Y-%m-%d> %^{会議名}',
                '** メモ',
                '- ',
            },
            target = '~/org/meetings.org',
        },
    },
})

require('org-bullets').setup()

vim.lsp.enable('org')

