 -- Author: Arthur Camargo
-- Main file for the game

local world = require('world')
local entities = {
    paddle = require('entities/paddle'),
    ball = require('entities/ball'),
    boundary = require('entities/boundary-top')
}

-- Boolean to keep track of whether our game is paused or not
local paused = false

local key_map = {
  escape = function()
    love.event.quit()
  end,
  space = function()
    paused = not paused
  end
}

love.draw = function()
  local ball_x, ball_y = entities.ball.body:getWorldCenter()
  love.graphics.circle('fill', ball_x, ball_y, entities.ball.shape:getRadius())
  love.graphics.polygon(
    'line',
    entities.paddle.body:getWorldPoints(entities.paddle.shape:getPoints())
  )
end

love.focus = function(focused)
  if not focused then
    paused = true
  end
end

love.keypressed = function(pressed_key)
  -- Check in the key map if there is a function
  -- that matches this pressed key's name
  if key_map[pressed_key] then
    key_map[pressed_key]()
  end
end

love.update = function(dt)
  if not paused then
    world:update(dt)
  end
end
