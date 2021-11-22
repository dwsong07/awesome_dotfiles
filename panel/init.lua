local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

awful.screen.connect_for_each_screen(function(s)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end))
    )

    -- Create the wibox
    s.panel = awful.wibar({ position = "bottom", screen = s, ontop = true })

    s.mypromptbox = awful.widget.prompt()

    s.systray = wibox.widget {
        {
            widget = wibox.widget.systray,
        },
        margins = dpi(5),
        widget = wibox.container.margin
    }

    s.tagList = require("widgets.tagList")(s)
    s.taskList = require("widgets.taskList")(s)
    s.clock = require("widgets.clock")(s)

    -- Add widgets to the wibox
    s.panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(5),
            mylauncher,
            s.tagList,
            s.mypromptbox
        },
        s.taskList, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(10),
            s.systray,
            s.clock,
            s.mylayoutbox,
        },
    }
end)
-- }}}