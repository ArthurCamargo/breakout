 -- Boundaries of the game
 -- Use a entity here, so it can be changed if you want to
 
 local world = require('world')

 local entity = {}

 entity.body = love.physics.newBody(world, 400, 5, 'static')
 entity.shape = love.physics.newRectangleShape(800, 20)
 entity.fixture = love.physics.newFixture(entity.body, entity.shape)
 entity.fixture:setUserData(entity)

 return entity
