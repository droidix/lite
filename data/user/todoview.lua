local View = require "core.view"
local core = require "core"
local style = require "core.style"

local common = require "core.common"

local TodoView = View:extend()

function TodoView:new()
  TodoView.super.new(self)
  self.scrollable = true
  self.yoffset = 0
  self.checked = false
end

function TodoView:get_name()
  return "Todo"
end

function TodoView:draw()
  self:draw_background(style.background)

  local ox, oy = self:get_content_offset()
  local x = ox + style.padding.x
  local y = oy + style.padding.y

  local color = style.background3
  if self.checked then
    color = { common.color "#ff0000" }
  end

  renderer.draw_rect(x, y, 15, 15, color)
  x = x + 20

  local endx = renderer.draw_text(style.font, "item 1", x, y, style.accent) - x

  if self.checked then
    -- draw a line through
    local ly = y + style.font:get_height() / 2 -1
    core.log("ly: %d", ly)
    renderer.draw_rect(x, ly, endx, 2, color)
  end
end

function TodoView:on_mouse_pressed(button, x, y, clicks)
  local caught = TodoView.super.on_mouse_pressed(self, button, x, y, clicks)
  if caught then
    return
  end

  local ox, oy = self:get_content_offset()
  local cx = x - ox - style.padding.x
  local cy = y - oy - style.padding.y
  core.log("x: %d", cx)
  core.log("y: %d", cy)

  if cx > 0 and cx <= 15 and cy > 0 and cy <= 15 then
    self.checked = true
    core.log("checked")
  end
end

return TodoView
