lua << EOF
local gps = require("nvim-gps")
gps.setup()
require("lualine").setup({
sections = {
	lualine_c = {
		'filename',
		{ gps.get_location, cond = gps.is_available },
		}
	}
})
EOF
