local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local clickable_container = require("widgets.clickable_container")

local createClock = function(s)
    local clock_format = "<span font='Ubuntu 12'>%Y-%m-%d %H:%M:%S</span>"

    local clock_widget = wibox.widget {
        {
            widget = wibox.widget.textclock(clock_format, 1),
        },
        widget = clickable_container
    }

    local calendar = awful.widget.calendar_popup.month({
        start_sunday = true,
        screen = s,
        spacing = dpi(5),
        margin = dpi(5),
        font = "Ubutnu 11",
        style_month = {
            border_width = dpi(0),
            padding = dpi(10),
        }
    })

    calendar:attach(clock_widget, "br", {
        on_pressed = true,
        on_hover = false
    })

    return clock_widget
end

return createClock;