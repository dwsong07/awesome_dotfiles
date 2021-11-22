-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Configuration
require("configuration.variables")

-- Autostart

-- Theme
beautiful.init(require("theme"))

-- Bindings
require("bindings.buttons")
require("bindings.globalKeys")
require("bindings.clientKeys")

-- Main
require("main.errorHandling")
require("main.autostart")
require("main.screen")
require("main.rules")
require("main.signals")
require("main.layouts")
require("main.menu")

-- Panel
require("panel")
