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
local hddtemp_widget   = require("layout.panel.services.hddtemp")

-- extras setup
local control_panel = wibox.widget {
	coretemps_widget,
	layout = wibox.layout.fixed.horizontal,
	spacing = dpi(22),
	visible = true
}

-- return
-- ~~~~~~
local returner = wibox.widget {
	{
		ram_widget,
		cpu_widget,
		hddtemp_widget,
		layout = wibox.layout.fixed.horizontal,
		spacing = dpi(22),
		visible = true
	},
	control_panel,
	visible = true,
	spacing = dpi(0),
	layout = wibox.layout.fixed.vertical
}


awesome.connect_signal("panel::extras", function(value)
	control_panel.visible = value or false
	if not value then
		returner.spacing = dpi(0)
	else
		returner.spacing = dpi(22)
	end
end)


return returner
