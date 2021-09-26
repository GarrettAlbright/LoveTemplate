Player = {}

function Player:load()
  self.icon = love.graphics.newImage("assets/love-icon.png")
  self.iconW, self.iconH = self.icon:getDimensions()
  self.halfIconW = self.iconW / 2
  self.halfIconH = self.iconH / 2
  self.elapsed = 0
  self.iconR = 0
end

function Player:update(dt)
  self.elapsed = (self.elapsed + dt) % 1
  self.iconR = 2 * math.pi * self.elapsed
end

function Player:draw()
  local winW, winH = love.window.getMode()
  local centerX = winW / 2
  local centerY = winH / 2
  love.graphics.draw(self.icon, centerX, centerY, self.iconR, 1, 1, self.halfIconW, self.halfIconH)
end

return Player
