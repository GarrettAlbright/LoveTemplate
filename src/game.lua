Game = {}

Game.player = require("src/player")
Game.isPaused = false

function Game:load()
  self.font = love.graphics.newFont(20)
  self.player:load()
end

function Game:update(dt)
  if self.isPaused then
    return
  end

  self.player:update(dt)
end

function Game:draw()
  self.player:draw()

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

return Game
