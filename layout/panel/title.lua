-- title widget
-- ~~~~~~~~~~~~~~

-- requirements
-- ~~~~~~~~~~~~
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")
local wibox = require("wibox")


-- widgets
-- ~~~~~~~
-- username
local title_widget = wibox.widget {
	widget = wibox.widget.textbox,
	markup = helpers.colorize_text("Statistics", beautiful.fg_color),
	font = beautiful.font_var .. "Medium 13",
	align = "left",
	valign = "center"
}


-- return
return wibox.widget {
	{
		nil,
		{
			title_widget,
			layout = wibox.layout.fixed.vertical,
			spacing = dpi(2)
		},
		layout = wibox.layout.align.vertical,
		expand = "none"
	},
	layout = wibox.layout.fixed.horizontal,
	spacing = dpi(15)
}
