local wibox = require('wibox')
local beautiful = require('beautiful')

local click_event = function(widget)
    local container = wibox.widget {
        widget,
        widget = wibox.container.place
    }

    local old_cursor, old_wibox

    container:connect_signal("mouse::enter", function()
        local w = mouse.current_wibox
        if w then
            old_cursor, old_wibox = w.cursor, w
            w.cursor = 'hand2'
        end
    end)

    container:connect_signal("mouse::leave", function()
        if old_cursor then
            old_wibox.cursor = old_cursor
            old_wibox = nil
        end
    end)

    return container
end

return click_event