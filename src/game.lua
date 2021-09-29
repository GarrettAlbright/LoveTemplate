local Game = {}

Game.player = require("src/player")
Game.isPaused = false
Game.bgGradient = nil

function Game:load()
  -- Set the font size for drawing the "Paused" text
  self.font = love.graphics.newFont(20)

  self.player:load()
end

function Game:update(dt)
  -- Don't update game state if the game is paused
  if self.isPaused then
    return
  end

  self.player:update(dt)
end

function Game:draw()
  -- Draw the background gradient if it's not set yet
  if (self.bgGradient == nil) then
    self:generateGradient()
  end
  love.graphics.draw(self.bgGradient)

  -- Draw the "player"
  self.player:draw()

  -- If the game is paused, darken the graphics by drawing a transparent black
  -- rectangle over it, then draw "Paused" text.
  -- @todo Store this in a canvas so we don't redraw the whole thing each frame
  --       while the game is paused.
  if self.isPaused then
    local winW, winH = love.window.getMode()
    love.graphics.setColor(0, 0, 0, .5)
    love.graphics.rectangle("fill", 0, 0, winW, winH)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(self.font)
    local textYPos = (winH / 2) + self.player.halfIconH + 10
    love.graphics.printf("Paused", 0, textYPos, winW, "center")
  end
end

function Game:setPause(pause)
  self.isPaused = pause
end

-- Draw a blue gradient to use as the background by drawing a series of
-- vertical lines in shades of blue.
function Game:generateGradient()
  local winW, winH = love.window.getMode()
  self.bgGradient = love.graphics.newCanvas(winW, winH)
  love.graphics.setCanvas(self.bgGradient)
  for yPos = 0, winH - 1 do
    local color = ((yPos / winH) * .4) + .4
    love.graphics.setColor(0, 0, color)
    love.graphics.line(0, yPos, winW, yPos)
  end
  love.graphics.setCanvas()
  -- Set color back to white so that the icon isn't tinted when drawn
  love.graphics.setColor(1, 1, 1, 1)
end

function Game:windowWasResized()
  -- Nil out the background gradient so it will be regenerated at the new size
  -- on the next draw() call
  self.bgGradient = nil
end

return Game
