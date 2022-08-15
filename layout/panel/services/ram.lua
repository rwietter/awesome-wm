-- wifi button/widget
-- ~~~~~~~~~~~~~~~~~~


-- requirements
-- ~~~~~~~~~~~~
local awful = require("awful")
local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")
local wibox = require("wibox")


-- misc/vars
-- ~~~~~~~~~

local service_icon = ""

-- widgets
-- ~~~~~~~

-- icon
local icon = wibox.widget {
	font = beautiful.icon_var .. "25",
	markup = helpers.colorize_text(service_icon, beautiful.bg_color),
	widget = wibox.widget.textbox,
	valign = "center",
	align = "center"
}

-- ram
local ram = watch('bash -c /home/rwietter/.config/awesome/scripts/ram.sh'
	, 5, function(widget, stdout)
		widget.markup = helpers.colorize_text(string.gsub(stdout, "%s+", ""), beautiful.bg_color)
	end, wibox.widget {
		font = beautiful.font_var .. "13",
		widget = wibox.widget.textbox,
		valign = "center",
		align = "center"
	})


-- mix those
local ram_widget = wibox.widget {
	{
		nil,
		{
			nil,
			{
				icon,
				ram,
				layout = wibox.layout.fixed.vertical,
				spacing = dpi(6)
			},
			layout = wibox.layout.align.vertical,
			expand = "none"
		},
		layout = wibox.layout.stack
	},
	shape = helpers.rrect(beautiful.rounded),
	widget = wibox.container.background,
	border_color = beautiful.fg_color .. "33",
	forced_width = dpi(110),
	forced_height = dpi(110),
	bg = beautiful.accent .. "BF"
}



ram_widget:buttons(gears.table.join({
	awful.button({}, 1, function()
		awful.spawn(home_var .. "/.config/awesome/scripts/calendar.sh", false)
	end)
}))




return ram_widget
