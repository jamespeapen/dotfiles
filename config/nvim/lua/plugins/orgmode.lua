return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    require('orgmode').setup({
      org_agenda_files = '~/Documents/orgmode/**/*',
      org_default_notes_file = '~/Documents/orgmode/refile.org',
    })
  end
}
