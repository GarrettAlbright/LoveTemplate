local game = require("src/Game")

function love.load()
  game:load()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()
  game:draw()
end

function love.focus(f)
  game:setPause(not f)
end

function love.keypressed(key)
  if (key == "escape") then
    game:setPause(not game.isPaused)
  end
end
