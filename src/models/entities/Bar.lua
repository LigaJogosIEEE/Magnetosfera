local Bar = {}

Bar.__index = Bar

function Bar:new(world, x, y, width, height)
    local this = {
        world = world or love.physics.newWorld(0, 0),
        body = love.physics.newBody(world, x, y, "kinematic"),
        shape = love.physics.newRectangleShape(width, height)
    }
    
    --aplying physics
    this.fixture = love.physics.newFixture(this.body, this.shape, 1)
    this.body:setFixedRotation(true)
    this.fixture:setUserData("Bar")
    this.fixture:setCategory(4)
    this.fixture:setMask(2, 3)
    this.fixture:setFriction(1)
    
    return setmetatable(this, Bar)
end

function Bar:update(dt)
    self.body:setLinearVelocity(0, 100)
end

function Bar:draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(1, 1, 1)
end

return Bar
