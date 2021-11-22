local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

local apps = {
    "picom --no-vsync"
}

local spawn_once = function (cmd)
	local findme = cmd
    local firstspace = cmd:find(" ")

    if firstspace then
        findme = cmd:sub(0, firstspace - 1)
    end

    awful.spawn.easy_async_with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd),
        function(_, stderr)
            if not stderr or stderr == '' then
            return
            end
            naughty.notify({
                app_name = 'Startup Applications',
                title = "Error starting application",
                text = "Running " .. cmd .. "got error: " ..  stderr,
                timeout = 10,
            })
        end
    )
end

for _, app in ipairs(apps) do
    spawn_once(app)
end