local Player = {}

Player.__index = Player

function Player:new(world)
    local this = {
        world = world or love.physics.newWorld(0, 0),
        body = love.physics.newBody(world, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, "dynamic"),
        shape = love.physics.newCircleShape(26)
    }
    
    --aplying physics
    this.fixture = love.physics.newFixture(this.body, this.shape, 1)
    this.body:setFixedRotation(true)
    this.fixture:setUserData("Player")
    this.fixture:setCategory(1)
    this.fixture:setMask(2, 3)
    this.fixture:setFriction(1)
    
    return setmetatable(this, Player)
end

function Player:setLinearVelocity(x, y)
    self.body:setLinearVelocity(x, y)
end

function Player:draw()
    love.graphics.setColor(1, 0, 0.4, 1)
    love.graphics.circle("line", self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(1, 1, 1, 1)
end

return Player