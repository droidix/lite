-- put user settings here
-- this module will be loaded after everything else when the application starts

local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- light theme:
-- require "user.colors.summer"

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }

local command = require "core.command"
local core = require "core"
local TodoView = require "user.todoview"



command.add(nil, {
  ["user:todo"] = function()
    local node = core.root_view:get_active_node()
    node:add_view(TodoView())
  end
})

command.perform("core:open-log")
command.perform("user:todo")
