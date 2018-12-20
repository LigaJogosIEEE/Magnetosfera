local Bar = {}

Bar.__index = Bar

function Bar:new(world, x, y, width, height, speed)
    local this = {
        world = world or love.physics.newWorld(0, 0),
        body = love.physics.newBody(world, x, y, "kinematic"),
        shape = love.physics.newRectangleShape(width, height),
        speed = speed or 100
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
    self.body:setLinearVelocity(0, self.speed)
    if self.body:getY() < 0 or self.body:getY() > 1000 then
        gameDirector:removeBar(self, self.speed < 0 and true)
    end
end

function Bar:draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
    love.graphics.setColor(1, 1, 1)
end

return Bar
