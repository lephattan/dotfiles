-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require 'nvim-tree'.setup {
  git = {
    ignore = false,
  },
  actions = {
	  open_file = {
		  quit_on_open = true,
		  window_picker = {
			  enable = true,
			  exclude = {
				  filetype = {'notify', 'packer', 'qf'},
				  buftype = {'terminal'}
			  },
		  },
      resize_window = false,
	  }
  },
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  --auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  --update_to_buf_dir   = {
    --enable = true,
    --auto_open = true,
  --},
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    -- height = 30,
    hide_root_folder = false,
    side = 'left',
    --auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
}

