-- LÖVE configuration file.
-- See: https://love2d.org/wiki/Config_Files

function love.conf(t)
  -- Allow window to be resized, but not too small
  t.window.resizable = true
  t.window.minwidth = 100
  t.window.minheight = 100

  -- Only enable modules and features we're using
  t.accelerometerjoystick = false
  t.modules.audio = false
  t.modules.data = false
  t.modules.event = true
  t.modules.font = true
  t.modules.joystick = false
  t.modules.keyboard = true
  t.modules.math = false
  t.modules.mouse = false
  t.modules.physics = false
  t.modules.sound = false
  t.modules.system = false
  t.modules.thread = false
  t.modules.touch = false
  t.modules.video = true
  t.modules.window = true
end
