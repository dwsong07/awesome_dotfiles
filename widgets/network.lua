local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")
local clickable_container = require("widgets.clickable_container")


local createNetwork = function(s)
    local widget = wibox.widget {
        {
            
            widget = wibox.widget.imagebox,
        },
        widget = clickable_container
    }
end

return createNetwork