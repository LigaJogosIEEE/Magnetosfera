local InGameScene = {}

InGameScene.__index = InGameScene

function InGameScene:new()    
    return setmetatable({
        orientation = true -- true for right, false for left
    }, InGameScene)
end

function InGameScene:mousemoved(x, y, dx, dy, istouch)
end

function InGameScene:mousepressed(x, y, button)
    if x <= love.graphics.getWidth() / 2 then
        if self.orientation then
            self.orientation = false
            gameDirector:getWorld().world:setGravity(-300, 0)
            gameDirector:getPlayer():setLinearVelocity(-300, 0)
        end
    else
        if not self.orientation then
            self.orientation = true
            gameDirector:getWorld().world:setGravity(300, 0)
            gameDirector:getPlayer():setLinearVelocity(300, 0)
        end
    end
end

function InGameScene:mousereleased(x, y, button)
end

function InGameScene:update(dt)
    bar:update(dt)
    gameDirector:update(dt)
end

function InGameScene:draw()
    gameDirector:draw()
end

return InGameScene
