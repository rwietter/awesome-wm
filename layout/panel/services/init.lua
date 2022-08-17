-- services buttons
-- ~~~~~~~~~~~~~~~~
-- each button has a fade animation when activated

-- requirements
-- ~~~~~~~~~~~~
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")


-- widgets
-- ~~~~~~~
local ram_widget       = require("layout.panel.services.ram")
local cpu_widget       = require("layout.panel.services.cpu")
local coretemps_widget = require("layout.panel.services.coretemps")
local homesize_widget   = require("layout.panel.services.home_size")

-- extras setup
local control_panel = wibox.widget {
	coretemps_widget,
	layout = wibox.layout.fixed.vertical,
	spacing = dpi(22),
	visible = false
}

local storage = wibox.widget {
	homesize_widget[2],
	layout = wibox.layout.fixed.vertical,
	spacing = dpi(22),
	visible = false
}

-- return
-- ~~~~~~
local returner = wibox.widget {
	{
		ram_widget,
		cpu_widget,
		homesize_widget[1],
		layout = wibox.layout.fixed.horizontal,
		spacing = dpi(22),
	},
	control_panel,
	{
		storage,
		layout = wibox.layout.fixed.horizontal,
		spacing = dpi(22),
	},
	spacing = dpi(22),
	layout = wibox.layout.fixed.vertical
}


awesome.connect_signal("panel::extras", function(value)
	control_panel.visible = value or false
	storage.visible = value or false
	if not value then
		returner.spacing = dpi(0)
	else
		returner.spacing = dpi(22)
	end
end)


return returner
