--
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

local storage_root_icon = ""
local storage_home_icon = ""

-- widgets
-- ~~~~~~~

-- icon
local storage_root_icon_widget = wibox.widget {
	font = beautiful.icon_var .. "25",
	markup = helpers.colorize_text(storage_root_icon, beautiful.bg_color),
	widget = wibox.widget.textbox,
	valign = "center",
	align = "center"
}

local storage_home_icon_widget = wibox.widget {
	font = beautiful.icon_var .. "25",
	markup = helpers.colorize_text(storage_home_icon, beautiful.bg_color),
	widget = wibox.widget.textbox,
	valign = "center",
	align = "center"
}

-- home size
local storage_home_size = watch('bash /home/rwietter/.config/awesome/scripts/ssd.sh "home"'
	, 600, function(widget, stdout)
		widget.markup = helpers.colorize_text(string.gsub(stdout, "%s+", ""), beautiful.bg_color)
	end, wibox.widget {
		font = beautiful.font_var .. "13",
		widget = wibox.widget.textbox,
		valign = "center",
		align = "center"
	})

-- root size
local storage_root_size = watch('bash /home/rwietter/.config/awesome/scripts/ssd.sh "root"'
	, 600, function(widget, stdout)
		widget.markup = helpers.colorize_text(string.gsub(stdout, "%s+", ""), beautiful.bg_color)
	end, wibox.widget {
		font = beautiful.font_var .. "13",
		widget = wibox.widget.textbox,
		valign = "center",
		align = "center"
	})


-- mix those
local home_size_widget = wibox.widget {
	{
		nil,
		{
			nil,
			{
				storage_home_icon_widget,
				storage_home_size,
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

local root_size_widget = wibox.widget {
	{
		nil,
		{
			nil,
			{
				storage_root_icon_widget,
				storage_root_size,
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



home_size_widget:buttons(gears.table.join({
	awful.button({}, 1, function()
		awful.spawn(home_var .. "/.config/awesome/scripts/calendar.sh", false)
	end)
}))

local widgets = {home_size_widget, root_size_widget}

return widgets
