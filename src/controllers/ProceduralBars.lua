local ProceduralBars = {}

ProceduralBars.__index = ProceduralBars

function ProceduralBars:new()
    return setmetatable({
        elapsedTime = 0,
        leftBars = {
            require "models.entities.Bar":new(gameDirector:getWorld().world, 10, 100, 20, 200)
        },
        rightBars = {}
    }, ProceduralBars)
end

function ProceduralBars:update(dt)
    
end

return ProceduralBars
