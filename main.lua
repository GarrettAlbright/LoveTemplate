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

-- Called when the game window gains or loses focus.
-- The f parameter is true if the window gains focus; false otherwise.
function love.focus(f)
  game:setPause(not f)
end

function love.keypressed(key)
  -- Toggle pausing the game if the escape key is pressed.
  if (key == "escape") then
    game:setPause(not game.isPaused)
  end
end
