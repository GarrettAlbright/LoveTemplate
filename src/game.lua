Game = {}

Game.isPaused = false

function Game:load()
  self.icon = love.graphics.newImage("assets/love-icon.png")
  self.iconW, self.iconH = self.icon:getDimensions()
  self.halfIconW = self.iconW / 2
  self.halfIconH = self.iconH / 2
  self.elapsed = 0
  self.iconR = 0
  self.font = love.graphics.newFont(20)
end

function Game:update(dt)
  if self.isPaused then
    return
  end

  self.elapsed = (self.elapsed + dt) % 1
  self.iconR = 2 * math.pi * self.elapsed
end

function Game:draw()
  local winW, winH = love.window.getMode()
  local centerX = winW / 2
  local centerY = winH / 2
  love.graphics.draw(self.icon, centerX, centerY, self.iconR, 1, 1, self.halfIconW, self.halfIconH)

  if self.isPaused then
    love.graphics.setColor(0, 0, 0, .5)
    love.graphics.rectangle("fill", 0, 0, winW, winH)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(self.font)
    love.graphics.printf("Paused", 0, centerY + self.halfIconH + 10, winW, "center")
  end
end

function Game:setPause(pause)
  self.isPaused = pause
end

return Game
